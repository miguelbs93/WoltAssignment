import DTOModels
import Foundation
import Managers
import Models
import Services
import SwiftUI

struct Location {
    let latitude: Double
    let longitude: Double
}


final class VenuesListViewModel: ObservableObject {
    @Published var venues: [Venue] = []
    @Published var isLoading: Bool = false
    
    private let favoritesManager: FavoritesManager
    
    private let locations = [
        Location(latitude: 60.169418, longitude: 24.931618),
        Location(latitude: 60.169818, longitude: 24.932906),
        Location(latitude: 60.170005, longitude: 24.935105),
        Location(latitude: 60.169108, longitude: 24.936210),
        Location(latitude: 60.168355, longitude: 24.934869),
        Location(latitude: 60.167560, longitude: 24.932562),
        Location(latitude: 60.168254, longitude: 24.931532),
        Location(latitude: 60.169012, longitude: 24.930341),
        Location(latitude: 60.170085, longitude: 24.929569)
    ]
    
    private let service: GetRestaurantsService
    private var currentIndex = 0
    private var timerTask: Task<Void, Never>?
    
    init(favoritesManager: FavoritesManager, service: GetRestaurantsService) {
        self.favoritesManager = favoritesManager
        self.service = service
    }
    
    @MainActor
    func startRotatingVenues() {
            timerTask?.cancel()
            timerTask = Task {
                while !Task.isCancelled {
                    await fetchVenues()
                    try? await Task.sleep(nanoseconds: 10 * 1_000_000_000) // 10 seconds
                    currentIndex = (currentIndex + 1) % locations.count
                }
            }
        }
    
    @MainActor
    func fetchVenues() async {
        let location = locations[currentIndex]
        withAnimation(.easeInOut(duration: 0.3)) {
            isLoading = true
        }
        
        do {
            let result = try await service.getRestaurants(
                latitude: location.latitude,
                longitude: location.longitude
            )
            
            self.venues = result?.sections[1].items.prefix(15).map {
                $0.getVenue()
            } ?? []
        } catch {
            debugPrint(error)
        }
        
        withAnimation(.easeInOut(duration: 0.3)) {
            isLoading = false
        }
    }
}

// MARK: - Favorites

extension VenuesListViewModel {
    func toggleFavorite(for venue: Venue) {
        favoritesManager.toggleFavorite(id: venue.id)
        objectWillChange.send()
    }

    func isFavorite(_ venue: Venue) -> Bool {
        favoritesManager.isFavorite(id: venue.id)
    }
}

// MARK: - Venue Mapper

extension SectionItemDTO {
    func getVenue() -> Venue {
        let venueDTO = self.venue
        return Venue(
            id: venueDTO?.id ?? "",
            title: venueDTO?.name ?? "",
            imageURL: self.image.url,
            shortDescription: venueDTO?.shortDescription ?? ""
        )
    }
}

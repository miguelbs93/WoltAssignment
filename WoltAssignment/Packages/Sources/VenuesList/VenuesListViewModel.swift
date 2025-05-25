import DTOModels
import Foundation
import Managers
import Models
import Services
import SwiftUI

final class VenuesListViewModel: ObservableObject {
    @Published var venues: [Venue] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let favoritesManager: FavoritesStoring
    private let locationProvider: LocationProviding
    
    private let service: GetVenuesServiceProtocol
    private var timerTask: Task<Void, Never>?
    
    init(
        favoritesManager: FavoritesStoring,
        locationProvider: LocationProviding,
        service: GetVenuesServiceProtocol
    ) {
        self.favoritesManager = favoritesManager
        self.locationProvider = locationProvider
        self.service = service
    }
    
    /// Starts a timer that fetches venues from rotating locations every 10 seconds.
    @MainActor
    func startRotatingVenues() {
            timerTask?.cancel()
            timerTask = Task {
                while !Task.isCancelled {
                    await fetchVenues()
                    try? await Task.sleep(nanoseconds: 10 * 1_000_000_000) // 10 seconds
                }
            }
        }
    
    /// Fetches venues based on the current location, updating the UI state.
    @MainActor
    func fetchVenues() async {
        let location = locationProvider.nextLocation()
        withAnimation(.easeInOut(duration: 0.3)) {
            isLoading = true
        }
        
        do {
            let result = try await service.getVenues(
                latitude: location.latitude,
                longitude: location.longitude
            )
            
            self.venues = result?.sections.first(where: {
                $0.contentType == nil
            })?.items.prefix(15).map {
                $0.getVenue()
            } ?? []
            
            if self.venues.isEmpty {
                self.errorMessage = "No venues available"
            }
            
        } catch {
            self.venues = []
            self.errorMessage = "Failed to load venues: \(error.localizedDescription)"
        }
        
        withAnimation(.easeInOut(duration: 0.3)) {
            isLoading = false
        }
    }
}

// MARK: - Favorites

extension VenuesListViewModel {
    /// Toggles the favorite state for a venue.
    func toggleFavorite(for venue: Venue) {
        favoritesManager.toggleFavorite(id: venue.id)
        objectWillChange.send()
    }

    /// Checks whether a venue is currently marked as favorite.
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

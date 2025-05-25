import DTOModels
import Foundation
import Models
import Services

struct Location {
    let latitude: Double
    let longitude: Double
}


final class VenuesListViewModel: ObservableObject {
    @Published var venues: [Venue] = []
    
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
    
    init(service: GetRestaurantsService) {
        self.service = service
    }
    
    @MainActor
    func fetchVenues() async {
        let location = locations[6]
        
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

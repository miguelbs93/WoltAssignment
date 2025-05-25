import XCTest
@testable import VenuesList
@testable import Models
@testable import Managers
@testable import Services
import DTOModels

// MARK: - Favorites Manager

final class MockFavoritesManager: FavoritesStoring {
    var favorites: Set<String> = []

    func toggleFavorite(id: String) {
        if favorites.contains(id) {
            favorites.remove(id)
        } else {
            favorites.insert(id)
        }
    }
    
    func isFavorite(id: String) -> Bool {
        favorites.contains(id)
    }
}

// MARK: - LocationProvider

final class MockLocationProvider: LocationProviding {
    func nextLocation() -> Location {
        Location(latitude: 60.0, longitude: 24.0)
    }
}

// MARK: - RestaurantsService

final class MockRestaurantsService: GetVenuesServiceProtocol {
    var mockResult: VenuesResponseDTO?

    override func getRestaurants(latitude: Double, longitude: Double) async throws -> VenuesResponseDTO? {
        return mockResult
    }
}

import XCTest

@testable import VenuesList

final class VenuesListViewModelTests: XCTestCase {
    func testToggleFavorite() {
        let manager = MockFavoritesManager()
        let viewModel = VenuesListViewModel(
            favoritesManager: manager,
            locationProvider: MockLocationProvider(),
            service: MockRestaurantsService(networkManager: NetworkManager())
        )

        let venue = Venue(id: "123", title: "Test", imageURL: "", shortDescription: "")
        XCTAssertFalse(viewModel.isFavorite(venue))
        viewModel.toggleFavorite(for: venue)
        XCTAssertTrue(viewModel.isFavorite(venue))
    }

    func testFetchVenuesSuccess() async {
        let mockService = MockRestaurantsService(networkManager: NetworkManager())
        mockService.mockResult = RootDTO(...) // Construct mock DTO as needed

        let viewModel = VenuesListViewModel(
            favoritesManager: MockFavoritesManager(),
            locationProvider: MockLocationProvider(),
            service: mockService
        )

        await viewModel.fetchVenues()
        XCTAssertFalse(viewModel.venues.isEmpty)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testFetchVenuesError() async {
        final class FailingService: GetRestaurantsService {
            override func getRestaurants(latitude: Double, longitude: Double) async throws -> RootDTO? {
                throw URLError(.badServerResponse)
            }
        }

        let viewModel = VenuesListViewModel(
            favoritesManager: MockFavoritesManager(),
            locationProvider: MockLocationProvider(),
            service: FailingService(networkManager: NetworkManager())
        )

        await viewModel.fetchVenues()
        XCTAssertTrue(viewModel.venues.isEmpty)
        XCTAssertNotNil(viewModel.errorMessage)
    }
}

import XCTest
@testable import VenuesList
@testable import Models
@testable import DTOModels
@testable import Services

@MainActor
final class VenuesListViewModelTests: XCTestCase {
    func makeViewModel(with mockResult: VenuesResponseDTO?) -> VenuesListViewModel {
        let mockFavorites = MockFavoritesManager()
        let mockLocationProvider = MockLocationProvider()
        let mockService = MockRestaurantsService()
        mockService.mockResult = mockResult
        
        return VenuesListViewModel(
            favoritesManager: mockFavorites,
            locationProvider: mockLocationProvider,
            service: mockService
        )
    }

    func testInitialState_isEmptyAndNotLoading() {
        let viewModel = makeViewModel(with: nil)

        XCTAssertTrue(viewModel.venues.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testToggleFavorite_addsAndRemovesVenue() {
        let viewModel = makeViewModel(with: nil)
        let venue = Venue(id: "abc123", title: "Test Venue", imageURL: "", shortDescription: "")

        XCTAssertFalse(viewModel.isFavorite(venue))
        viewModel.toggleFavorite(for: venue)
        XCTAssertTrue(viewModel.isFavorite(venue))
        viewModel.toggleFavorite(for: venue)
        XCTAssertFalse(viewModel.isFavorite(venue))
    }

    func testFetchVenues_successWithResults() async {
        // Arrange a mock venue
        
        let data = try! JSONSerialization.data(withJSONObject: json, options: [])
        let response = try! JSONDecoder().decode(VenuesResponseDTO.self, from: data)
        
        let viewModel = makeViewModel(with: response)

        // Act
        await viewModel.fetchVenues()

        // Assert
        XCTAssertFalse(viewModel.venues.isEmpty)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testFetchVenues_failureSetsError() async {
        final class FailingService: GetVenuesServiceProtocol {
            func getVenues(latitude: Double, longitude: Double) async throws -> VenuesResponseDTO? {
                throw URLError(.badServerResponse)
            }
        }

        let viewModel = VenuesListViewModel(
            favoritesManager: MockFavoritesManager(),
            locationProvider: MockLocationProvider(),
            service: FailingService()
        )

        await viewModel.fetchVenues()

        XCTAssertTrue(viewModel.venues.isEmpty)
        XCTAssertNotNil(viewModel.errorMessage)
    }
}

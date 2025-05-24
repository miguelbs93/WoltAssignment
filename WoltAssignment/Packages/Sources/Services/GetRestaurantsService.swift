import DTOModels
import NetworkManager

// MARK: - GetRestaurantsServiceProtocol
public protocol GetRestaurantsServiceProtocol {
    func getRestaurants(for latitude: Double, longitude: Double) async throws -> [VenueDTO]?
}

// MARK: - GetRestaurantsService
public struct GetRestaurantsService: GetRestaurantsServiceProtocol {
    
    private let networkManager: NetworkClient
    
    public func getRestaurants(for latitude: Double, longitude: Double) async throws -> [VenueDTO]? {
        let request = GetRestaurantsRequest(latitude: latitude, longitude: longitude)
        let response = try await networkManager.request(request, responseType: [VenueDTO].self)
        return response
    }
}

import DTOModels
import NetworkManager

// MARK: - GetRestaurantsServiceProtocol

public protocol GetRestaurantsServiceProtocol {
    func getRestaurants(latitude: Double, longitude: Double) async throws -> RestaurantsResponseDTO?
}

// MARK: - GetRestaurantsService

public struct GetRestaurantsService: GetRestaurantsServiceProtocol, Sendable {
    
    private let networkManager: NetworkClient
    
    public init(networkManager: NetworkClient) {
        self.networkManager = networkManager
    }
    
    public func getRestaurants(latitude: Double, longitude: Double) async throws -> RestaurantsResponseDTO? {
        let request = GetRestaurantsRequest(latitude: latitude, longitude: longitude)
        return try await networkManager.request(request, responseType: RestaurantsResponseDTO.self)
    }
}

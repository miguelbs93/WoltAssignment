import DTOModels
import NetworkManager

// MARK: - GetRestaurantsServiceProtocol

public protocol GetVenuesServiceProtocol: Sendable {
    func getVenues(latitude: Double, longitude: Double) async throws -> VenuesResponseDTO?
}

// MARK: - GetRestaurantsService

public final class GetVenuesService: GetVenuesServiceProtocol, Sendable {
    
    private let networkManager: NetworkClient
    
    public init(networkManager: NetworkClient) {
        self.networkManager = networkManager
    }
    
    public func getVenues(latitude: Double, longitude: Double) async throws -> VenuesResponseDTO? {
        let request = GetVenuesRequest(latitude: latitude, longitude: longitude)
        return try await networkManager.request(request, responseType: VenuesResponseDTO.self)
    }
}

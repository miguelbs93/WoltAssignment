import NetworkManager

public protocol GetRestaurantsServiceProtocol {
    func getRestaurants(for latitude: Double, longitude: Double) async throws -> [String]
}



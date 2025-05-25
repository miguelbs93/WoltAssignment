// MARK: - FiltersDTO

public struct FilteringDTO: Decodable, Sendable {
    public let filters: [FilterDTO]
}

// MARK: - FilterDTO

public struct FilterDTO: Decodable, Sendable {
    public let id: String
    public let name: String?
    public let type: String
    public let values: [FilterValueDTO]
}

// MARK: - FilterValueDTO

public struct FilterValueDTO: Decodable, Sendable {
    public let id: String
    public let name: String
}

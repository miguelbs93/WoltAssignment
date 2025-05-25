// MARK: - LinkDTO

public struct LinkDTO: Decodable, Sendable {
    public let target: String?
    public let targetSort: String?
    public let targetTitle: String?
    public let telemetryObjectId: String?
    public let title: String?
    public let type: String
    public let viewName: String?
    
    enum CodingKeys: String, CodingKey {
        case target
        case targetSort = "target_sort"
        case targetTitle = "target_title"
        case telemetryObjectId = "telemetry_object_id"
        case title
        case type
        case viewName = "view_name"
    }
}

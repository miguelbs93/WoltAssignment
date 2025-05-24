// MARK: - LinkDTO

public struct ItemLinkDTO: Decodable {
    let target: String
    let targetSort: String
    let targetTitle: String
    let telemetryObjectId: String
    let title: String
    let type: String
    let viewName: String

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

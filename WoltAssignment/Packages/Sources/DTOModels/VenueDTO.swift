// MARK: - VenueDTO

public struct VenueDTO: Decodable {
    let contentId: String
    let description: String
    let image: ImageDTO
    let link: ItemLinkDTO
    let quantity: Int
    let quantityStr: String
    let telemetryObjectId: String
    let template: String
    let title: String
    let trackId: String

    enum CodingKeys: String, CodingKey {
        case contentId = "content_id"
        case description
        case image
        case link
        case quantity
        case quantityStr = "quantity_str"
        case telemetryObjectId = "telemetry_object_id"
        case template
        case title
        case trackId = "track_id"
    }
}

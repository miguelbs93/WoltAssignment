public struct SectionItemDTO: Decodable, Sendable {
    public let contentId: String?
    public let description: String?
    public let image: ImageDTO
    public let link: LinkDTO?
    public let quantity: Int?
    public let quantityStr: String?
    public let telemetryObjectId: String?
    public let template: String?
    public let title: String
    public let trackId: String?
    public let venue: VenueDTO?

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
        case venue
    }
}

// MARK: - SectionDTO

public struct SectionDTO: Decodable, Sendable {
    public let contentId: String?
    public let contentType: String?
    public let endOfSection: EndOfSectionDTO?
    public let hideDeliveryInfo: Bool?
    public let items: [SectionItemDTO]
    public let link: LinkDTO?
    public let name: String?
    public let template: String?
    public let title: String?
    
    enum CodingKeys: String, CodingKey {
        case contentId = "content_id"
        case contentType = "content_type"
        case endOfSection = "end_of_section"
        case hideDeliveryInfo = "hide_delivery_info"
        case items
        case link
        case name
        case template
        case title
    }
}

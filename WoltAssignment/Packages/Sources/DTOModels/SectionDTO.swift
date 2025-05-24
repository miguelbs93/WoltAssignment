// MARK: - SectionDTO

public struct SectionDTO: Decodable {
    let contentId: String
    let contentType: String?
    let endOfSection: EndOfSection?
    let hideDeliveryInfo: Bool?
    let items: [Item]
    let link: ItemLinkDTO?
    let name: String?
    let template: String?
    let title: String?

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

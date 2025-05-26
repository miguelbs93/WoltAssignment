public struct VenueDTO: Decodable, Sendable {
    public let id: String
    public let name: String
    public let address: String
    public let city: String?
    public let country: String
    public let currency: String
    public let delivers: Bool?
    public let deliveryHighlight: Bool?
    public let deliveryPriceHighlight: Bool?
    public let franchise: String?
    public let location: [Double]
    public let online: Bool
    public let priceRange: Int
    public let productLine: String?
    public let shortDescription: String?
    public let showWoltPlus: Bool?
    public let slug: String
    public let tags: [String]
    public let brandImage: ImageDTO?
    public let venuePreviewItems: [VenuePreviewItemDTO]?

    enum CodingKeys: String, CodingKey {
        case id, name, address, city, country, currency, delivers
        case deliveryHighlight = "delivery_highlight"
        case deliveryPriceHighlight = "delivery_price_highlight"
        case franchise, location, online
        case priceRange = "price_range"
        case productLine = "product_line"
        case shortDescription = "short_description"
        case showWoltPlus = "show_wolt_plus"
        case slug, tags
        case brandImage = "brand_image"
        case venuePreviewItems = "venue_preview_items"
    }
}

public struct VenuePreviewItemDTO: Decodable, Sendable {
    public let id: String
    public let name: String
    public let price: Int
    public let currency: String
    public let image: ImageDTO
}

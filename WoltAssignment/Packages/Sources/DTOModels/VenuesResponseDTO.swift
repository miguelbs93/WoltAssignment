public struct VenuesResponseDTO: Decodable, Sendable {
    public let created: DateDTO
    public let expiresInSeconds: Int
    public let filtering: FilteringDTO
    public let howSearchWorksLink: LinkDTO
    public let howSearchWorksUrl: String
    public let name: String
    public let pageTitle: String
    public let sections: [SectionDTO]
    
    enum CodingKeys: String, CodingKey {
        case created
        case expiresInSeconds = "expires_in_seconds"
        case filtering
        case howSearchWorksLink = "how_search_works_link"
        case howSearchWorksUrl = "how_search_works_url"
        case name
        case pageTitle = "page_title"
        case sections
    }
}


// MARK: - DateDTO

public struct DateDTO: Decodable, Sendable {
    public let date: Int64

    enum CodingKeys: String, CodingKey {
        case date = "$date"
    }
}

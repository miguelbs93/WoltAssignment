struct RestaurantsResponseDTO: Decodable {
    let created: DateDTO
    let expiresInSeconds: Int
    let filtering: Filtering
    let howSearchWorksLink: Link
    let howSearchWorksUrl: String
    let name: String
    let pageTitle: String
    let sections: [Section]
    
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

struct DateDTO: Decodable {
    let date: Int64

    enum CodingKeys: String, CodingKey {
        case date = "$date"
    }
}

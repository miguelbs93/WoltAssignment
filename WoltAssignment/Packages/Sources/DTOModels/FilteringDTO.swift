// MARK: - FiltersDTO

struct FiltersDTO: Decodable {
    let filters: [Filter]
}

// MARK: - FilterDTO

struct FilterDTO: Decodable {
    let id: String
    let name: String?
    let type: String
    let values: [FilterValue]
}

// MARK: - FilterValueDTO

struct FilterValueDTO: Decodable {
    let id: String
    let name: String
}

// MARK: - FiltersDTO

public struct FiltersDTO: Decodable {
    let filters: [Filter]
}

// MARK: - FilterDTO

public struct FilterDTO: Decodable {
    let id: String
    let name: String?
    let type: String
    let values: [FilterValue]
}

// MARK: - FilterValueDTO

public struct FilterValueDTO: Decodable {
    let id: String
    let name: String
}

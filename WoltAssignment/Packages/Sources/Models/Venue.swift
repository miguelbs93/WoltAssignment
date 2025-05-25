public struct Venue: Identifiable {
    public let id: String
    public let title: String
    public let imageURL: String
    public let shortDescription: String
    
    public init(
        id: String,
        title: String,
        imageURL: String,
        shortDescription: String
    ) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.shortDescription = shortDescription
    }
}

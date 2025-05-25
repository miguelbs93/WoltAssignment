// MARK: - Location

public struct Location {
    public let latitude: Double
    public let longitude: Double
    
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

// MARK: - LocationRotator

public protocol LocationProviding {
    func nextLocation() -> Location
}

public final class LocationRotator: LocationProviding {
    private let locations: [Location]
    private var currentIndex = 0
    
    public init(locations: [Location]) {
        self.locations = locations
    }
    
    public func nextLocation() -> Location {
        let location = locations[currentIndex]
        currentIndex = (currentIndex + 1) % locations.count
        return location
    }
}

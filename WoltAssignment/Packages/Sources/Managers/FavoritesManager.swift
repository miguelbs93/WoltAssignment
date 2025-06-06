import Foundation

public protocol FavoritesStoring {
    func isFavorite(id: String) -> Bool
    func toggleFavorite(id: String)
}

// MARK:  Implementation

public final class FavoritesManager: FavoritesStoring {
    private let key = "favoriteVenueIDs"
    private let defaults = UserDefaults.standard

    public init() {}
    
    public func isFavorite(id: String) -> Bool {
        favoriteIDs.contains(id)
    }

    public func toggleFavorite(id: String) {
        var ids = favoriteIDs
        if ids.contains(id) {
            ids.remove(id)
        } else {
            ids.insert(id)
        }
        save(ids: ids)
    }

    private var favoriteIDs: Set<String> {
        Set(defaults.stringArray(forKey: key) ?? [])
    }

    private func save(ids: Set<String>) {
        defaults.set(Array(ids), forKey: key)
    }
}

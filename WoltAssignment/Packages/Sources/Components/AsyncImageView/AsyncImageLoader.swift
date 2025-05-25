import SwiftUI
import NetworkManager

final class AsyncImageLoader: @unchecked Sendable, ObservableObject {
    @Published var image: UIImage?
    private let networkManager: NetworkClient

    private let url: URL

    init(url: URL, networkManager: NetworkClient) {
        self.url = url
        self.networkManager = networkManager
    }
    
    @MainActor
    func load() async {
        do {
            let downloaded = try await networkManager.downloadImage(from: url)
            self.image = downloaded
        } catch {
            print("Image loading failed: \(error)")
        }
    }
}

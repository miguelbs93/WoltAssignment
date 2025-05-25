import SwiftUI
import NetworkManager

final class AsyncImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let networkManager: NetworkClient

    private let url: URL

    init(url: URL, networkManager: NetworkClient) {
        self.url = url
        self.networkManager = networkManager
    }

    func load() async {
        do {
            let downloaded = try await networkManager.downloadImage(from: url)
            image = downloaded
        } catch {
            print("Image loading failed: \(error)")
        }
    }
}

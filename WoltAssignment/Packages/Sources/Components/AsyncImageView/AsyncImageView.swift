import NetworkManager
import SwiftUI

public struct AsyncImageView: View {
    @StateObject private var loader: AsyncImageLoader

    public init(url: URL, networkManager: NetworkClient) {
        _loader = StateObject(wrappedValue: AsyncImageLoader(url: url, networkManager: networkManager))
    }

    public var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
            } else {
                ProgressView()
            }
        }
        .onAppear {
            Task {
                await loader.load()
            }
        }
    }
}

import Foundation
import UIKit

final class NetworkManager: NetworkClient {
    private let urlSession: URLSession
    private let imageCache = ImageCache()
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    // HTTP URL Request
    
    func request<T: Decodable>(_ endpoint: Endpoint, responseType: T.Type) async throws -> T {
        let request = endpoint.urlRequest
        let (data, response) = try await urlSession.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw APIError.httpStatus(code: httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decoding(error)
        }
    }
    
    // Download Image + Cache
    
    func downloadImage(from url: URL) async throws -> UIImage {
        if let cached = imageCache.image(for: url) {
            return cached
        }
        
        let (data, response) = try await urlSession.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode),
              let image = UIImage(data: data) else {
            throw URLError(.cannotDecodeContentData)
        }
        
        imageCache.insertImage(image, for: url)
        return image
    }
}

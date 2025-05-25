import Foundation
import UIKit

public final class NetworkManager: NetworkClient, @unchecked Sendable {
    private let urlSession: URLSession
    private let imageCache = ImageCache()
    
    public var baseURL: URL {
        return APIConfig.baseURL
    }
    
    public init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    // HTTP URL Request
    
    public func request<T: Decodable>(_ request: HTTPRequest, responseType: T.Type) async throws -> T {
        let request = request.urlRequest(with: baseURL)
        debugPrint("********* \(request.url?.absoluteString ?? "No URL")")
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
    
    public func downloadImage(from url: URL) async throws -> UIImage {
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

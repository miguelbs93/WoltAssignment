import Foundation
import UIKit

public protocol NetworkClient: Sendable {
    var baseURL: URL { get }
    func request<T: Decodable>(_ request: HTTPRequest, responseType: T.Type) async throws -> T
    func downloadImage(from url: URL) async throws -> UIImage
}

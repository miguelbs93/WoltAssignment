import UIKit

protocol ImageCaching {
    func image(for url: URL) -> UIImage?
    func insertImage(_ image: UIImage, for url: URL)
    func removeImage(for url: URL)
    func removeAll()
}

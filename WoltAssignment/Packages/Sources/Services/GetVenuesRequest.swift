import NetworkManager
import Foundation

struct GetVenuesRequest: HTTPRequest {
    let latitude: Double
    let longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var path: String {
        "pages/restaurants"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: [String: String] {
        [:]
    }
    
    var parameters: [String : Any] {
        [
            "lat": "\(latitude)",
            "lon": "\(longitude)"
        ]
    }
}

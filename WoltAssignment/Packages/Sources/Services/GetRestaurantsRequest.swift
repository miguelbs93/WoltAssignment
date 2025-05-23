import NetworkManager
import Foundation

struct GetRestaurantsRequest: HTTPRequest {
    let latitude: Double
    let longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var path: String {
        ""
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: [String: String] {
        [:]
    }
    
    var parameters: [String : Any] {
        [:]
    }
}

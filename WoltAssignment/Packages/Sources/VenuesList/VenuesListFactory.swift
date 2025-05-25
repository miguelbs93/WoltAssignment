import NetworkManager
import Services

public final class VenuesListFactory {
    public class func makeVenuesList() -> VenuesList {
        let service = GetRestaurantsService(networkManager: NetworkManager())
        let viewModel = VenuesListViewModel(service: service)
        return VenuesList(viewModel: viewModel)
    }
}

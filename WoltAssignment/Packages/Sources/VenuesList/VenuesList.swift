import SwiftUI

public struct VenuesList: View {
    @StateObject var viewModel: VenuesListViewModel
    
    public var body: some View {
        NavigationView {
            List(viewModel.venues) { item in
                VenuesRow(venue: item)
            }
            .navigationTitle("Nearby Venues")
        }
        .task {
            await viewModel.fetchVenues()
        }
    }
}

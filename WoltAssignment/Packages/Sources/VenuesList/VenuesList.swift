import SwiftUI

public struct VenuesList: View {
    @StateObject var viewModel: VenuesListViewModel
    
    public var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                if viewModel.isLoading {
                    HStack {
                        Spacer()
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding(8)
                        Spacer()
                    }
                    .background(Color(.systemGroupedBackground))
                    .transition(.move(edge: .top).combined(with: .opacity))
                }
                
                List(viewModel.venues) { item in
                    VenuesRow(
                        venue: item,
                        isFavorite: viewModel.isFavorite(item),
                        onFavoriteTapped: {
                            viewModel.toggleFavorite(for: item)
                    })
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Nearby Venues")
        }
        .onAppear {
            viewModel.startRotatingVenues()
        }
    }
}

import Models
import SwiftUI
import Components
// Remove this later
import NetworkManager

struct VenuesRow: View {
    let venue: Venue
    let isFavorite: Bool
    let networkManager: NetworkClient = NetworkManager()
    let onFavoriteTapped: () -> Void
    
    var body: some View {
        HStack {
            AsyncImageView(
                url: URL(string: venue.imageURL)!,
                networkManager: networkManager
            )
            .frame(width: 60, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .background(Color.gray.opacity(0.1))
            
            VStack(alignment: .leading) {
                Text(venue.title)
                    .font(.headline)
                Text(venue.shortDescription)
                    .font(.caption)
            }
            
            Spacer()
            
            Button(action: onFavoriteTapped) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(isFavorite ? .black : .gray)
            }
            .buttonStyle(.plain)
        }
    }
}

import Models
import SwiftUI
import Components
// Remove this later
import NetworkManager

struct VenuesRow: View {
    let venue: Venue
    @State var isFavorite: Bool = false
    
    var body: some View {
        HStack {
            AsyncImageView(
                url: URL(string: venue.imageURL)!,
                networkManager: NetworkManager()
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
            
            Button(action: {
                isFavorite.toggle()
            }) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(isFavorite ? .black : .gray)
            }
            .buttonStyle(.plain)
        }
    }
}

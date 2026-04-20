
import SwiftUI

struct DetailView: View {
    let anime: Anime
    @Binding var favorites: Set<Int>
    var isFav: Bool {
        favorites.contains(anime.mal_id)
    }
    
    var body: some View {
        ScrollView{
            VStack (spacing: 15){
                Text(anime.title)
                    .font(.title)
                    .bold()
                AsyncImage(url: URL(string:anime.images.jpg.image_url)) {image in image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Color.gray.opacity(0.2)
                }
                .frame(height:350)
                .clipShape(RoundedRectangle(cornerRadius:8))
                
                HStack {
                    Spacer()
                    Text("⭐️ \(anime.score, specifier: "%.1f")")
                        .foregroundColor(.gray)
                    Button {
                        toggleFav()
                    } label: {
                        Image(systemName: isFav ? "heart.fill" : "heart")
                            .foregroundStyle(Color.red)
                    }
                }
                .font(.system(size:20))
                
                Text(anime.synopsis ?? "No description available.")
                    .font(.body)
            }
            .padding(.horizontal)
        }
    }
    // function from CardView
    func toggleFav() {
        if favorites.contains(anime.mal_id) { // is mal_id already in list?
            favorites.remove(anime.mal_id) // if yes then remove it
        } else {
            favorites.insert(anime.mal_id) // if no then add it
        }
    }
}


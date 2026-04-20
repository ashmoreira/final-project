

import SwiftUI

struct ListCardView: View {
    let anime: Anime
    @Binding var favorites: Set<Int>
    
    var isFav: Bool {
        favorites.contains(anime.mal_id) // tracks if specific mal_id already in list of favorites
    }
    
    var body: some View {
        HStack() {
            //            to convertr url for image
            AsyncImage(url: URL(string:anime.images.jpg.image_url)) {image in image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.2)
            }
            .frame(width:120)
            .clipShape(RoundedRectangle(cornerRadius:8))
            VStack(alignment:.leading){
                Text(anime.title)
                    .font(.body)
                    .lineLimit(2)
                    .frame(height:34, alignment:.top)
                HStack{
                    Text("⭐️ \(anime.score, specifier: "%.1f")")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Button {
                        toggleFav() // a new button made to add/remove mal_id from favorites list
                    } label: {
                        Image(systemName: isFav ? "heart.fill" : "heart")
                        .foregroundStyle(Color.red)
                    }
                }
                Text("Add Review")
                    .font(.callout)
                    .foregroundColor(Color.black.opacity(0.6))
            }
            .padding(.horizontal)
        }
        .foregroundStyle(Color.black)
    }
    
    
    func toggleFav() {
        if favorites.contains(anime.mal_id) { // is mal_id already in list?
            favorites.remove(anime.mal_id) // if yes then remove it
        } else {
            favorites.insert(anime.mal_id) // then add it
        }
    }
}

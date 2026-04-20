import SwiftUI

struct FavoritesView: View {
    @State private var anime: [Anime] = []
    @Binding var favorites: Set<Int>
    let service = NetworkingService()
    
    var favoriteAnime: [Anime] {
        anime.filter { favorites.contains($0.mal_id)} // filters through all anime to see which mal_ids are in favorites to be able to be listed
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(favoriteAnime, id: \.mal_id) { item in ListCardView(anime:item, favorites: $favorites)}
                
            }
            .navigationTitle(Text("Favorites"))
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                    } label : {
                        Image(systemName: "magnifyingglass")
                    }
                }
                
            }
            
        }
        .task {
            anime = try! await service.getAnime()
        }
    }
}


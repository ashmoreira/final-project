
import SwiftUI

struct SuggestedView: View {
    let service = NetworkingService()
    @State var anime: [Anime] = []
    @Binding var favorites: Set<Int>
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                
                VStack(alignment: .leading,spacing:20) {
                    Text("Popular")
                        .font(.title)
                        .bold()
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(popular.prefix(21), id: \.mal_id) { item in GridCardView(anime:item)}
                    }
                    Text("Top Rated")
                        .font(.title)
                        .bold()
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(topRated.prefix(21), id: \.mal_id) {
                            item in GridCardView(anime:item)
                        }
                    }
                    
                }
            }
            .padding()
        }
        .navigationTitle(Text("Suggested"))
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                } label : {
                    Image(systemName: "magnifyingglass")
                        .padding(.horizontal)
                }
            }
        }
        .task {
            await loadAnime()
        }
    }
    
    // calling api using Service
    
    func loadAnime() async {
        do {
            anime = try await service.getAnime()
        } catch {
            print("Error loading anime: \(error)")
        }
    }
    
    var topRated : [Anime] { // / creates new array and puts larger number (of score) first
        anime.sorted {$0.score > $1.score}
    }
    
    var popular : [Anime] { // creates new array and puts smaller number (of popularity) first 
        anime.sorted {$0.popularity < $1.popularity}
    }
}


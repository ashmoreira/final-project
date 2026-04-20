
import SwiftUI

struct HomeView: View {
    @State private var anime: [Anime] = []
    @Binding var favorites: Set<Int>
    let service = NetworkingService()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack(alignment: .leading, spacing: 20){
                    
                    ForEach(genresList, id: \.self) {genre in
                        RowView(favorites: $favorites, genre: genre, anime: Array(anime(for:genre).prefix(20))
                        )
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Home"))
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
    
    
    // to add a list of the genres within the api
    
    var genresList: [String] {
        var result: [String] = [] // creates empty list
        
        for show in anime { // for each show in api
            for genre in show.genres { // for each genre within the show's genres
                if !result.contains(genre.name) { // if genre not already within list
                    result.append(genre.name) // add genre to list
                }
            }
        }
        return result.sorted() // return full list sorted alphabetically
    }
    
    // filter list so that when called only calls on anime of one specific genre
    func anime(for genre: String) -> [Anime] {
        var result: [Anime] = [] // empty list
        
        for show in anime {
            for g in show.genres {
                if g.name == genre {
                    result.append(show)
                    break
                }
            }
        }
        return result
    }
}

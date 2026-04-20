import SwiftUI

struct ContentView: View {
    @State var favorites: Set<Int> = [] // to store which ids are marked as favorites
    var body: some View {
        
        TabView {
            NavigationStack{
                HomeView(favorites: $favorites)
            }
            .tabItem {
                Label("Home", systemImage: "house")
                }
            
            NavigationStack{
                SuggestedView(favorites: $favorites)
            }
            .tabItem {
                Label("Suggested", systemImage: "circle.grid.2x2.fill")
            }

            NavigationStack {
                FavoritesView(favorites: $favorites)
            }
            .tabItem {
                Label("Favorites", systemImage: "heart.fill")
                }
        }
        .tint(Color(red: 159/255, green: 43/255, blue: 104/255))
    }
}

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {

            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            Text("Suggested")
                .tabItem {
                    Label("Suggested", systemImage: "circle.grid.2x2.fill")
                }

            Text("Favorites")
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
        .tint(Color(red: 159/255, green: 43/255, blue: 104/255))
    }
}

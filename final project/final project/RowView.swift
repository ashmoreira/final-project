import SwiftUI

struct RowView: View {
    @Binding var favorites: Set<Int>
    let genre: String
    let anime: [Anime]
    
    var body: some View {
        VStack(alignment: .leading, spacing:10) {
            Text(genre)
                .font(.title2)
                .bold()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(anime, id: \.mal_id) { item in
                        NavigationLink {
                            DetailView(anime: item, favorites: $favorites)
                        } label: {
                            CardView(anime: item, favorites: $favorites)
                        }
                        .frame(width:140)
                    }
                }
                .padding(.horizontal)
            }

            
        }
        
    }
}


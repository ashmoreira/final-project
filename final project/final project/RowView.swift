import SwiftUI

struct RowView: View {
    let genre: String
    let anime: [Anime]
    
    var body: some View {
        VStack(alignment: .leading, spacing:10) {
            Text(genre)
                .font(.title2)
                .bold()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(anime, id: \.mal_id) { item in CardView(anime:item)
                            .frame(width:140)
                    }
                }
                .padding(.horizontal)
            }

            
        }
        
    }
}


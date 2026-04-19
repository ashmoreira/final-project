
import SwiftUI

struct CardView: View {
    let anime: Anime
    @State var isFav: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing:10) {
//            to convertr url for image
            AsyncImage(url: URL(string:anime.images.jpg.image_url)) {image in image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.2)
            }
            .frame(width:150, height:210)
            .clipShape(RoundedRectangle(cornerRadius:8))
    
            Text(anime.title)
                .font(.callout)
                .lineLimit(2)
                .frame(height:34, alignment:.top)
            HStack{
                    Button {
                        isFav.toggle()
                    } label: {
                        Image(systemName: isFav ? "heart.fill" : "heart")
                            .foregroundStyle(Color.red)
                    }
                Spacer()
                    Text("⭐️ \(anime.score, specifier: "%.1f")")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        .frame(width:150)
        }
    }





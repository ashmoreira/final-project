
import SwiftUI

struct GridCardView: View {
    let anime: Anime
    
    var body: some View {
        VStack(alignment: .leading,spacing:10) {
//            to convertr url for image
            AsyncImage(url: URL(string:anime.images.jpg.image_url)) {image in image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.2)
            }
            .frame(width:100)
            .clipShape(RoundedRectangle(cornerRadius:8))
    
            Text(anime.title)
                .font(.callout)
                .lineLimit(2)
                .frame(height:34, alignment:.top)
                }
        .frame(width:100)
        .foregroundStyle(Color.black)
        }
    }




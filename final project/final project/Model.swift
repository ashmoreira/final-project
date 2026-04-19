import Foundation

struct AnimeData: Codable {
    let data: [Anime]
}

struct Anime: Codable {
    let mal_id: Int
    let images: Images
    let title: String
    let episodes: Int?
    let airing: Bool
    let duration: String?
    let rating: String?
    let score: Double
    let popularity: Int
    let rank: Int?
    let synopsis: String?
    let genres: [Genre]
}

struct Images: Codable {
    let jpg: JPG
}

struct JPG: Codable {
    let image_url: String
}

struct Genre: Codable {
    let mal_id: Int
    let name: String
}

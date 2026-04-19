
import Foundation

class NetworkingService {
    func getAnime () async throws -> [Anime] {
//        defining url
        let url = URL(string: "https://api.jikan.moe/v4/anime")!
//        ensuring url is valid and returning if not
        do {
//        request data from URL
            let (data, _) = try await URLSession.shared.data(from: url)
//        decoding json data into swift
            let response = try JSONDecoder().decode(AnimeData.self, from: data)
            return response.data
//            catching errors
        } catch let error as URLError {
            print("Network error: \(error.localizedDescription)")
            throw error
        } catch let error as DecodingError {
            switch error {
            case .typeMismatch(_, let context):
                print(context.debugDescription)
            case .valueNotFound(_, let context):
                print(context.debugDescription)
            case .keyNotFound(_, let context):
                print(context.debugDescription)
            case .dataCorrupted(let context):
                print(context.debugDescription)
//           swift made me add this i am not sure what it does
            @unknown default:
                print("Unknown decoding error")
            }
            throw error
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
}


    

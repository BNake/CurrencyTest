
import Foundation

// MARK: - MovieDetailModel
class MovieDetailModel: Codable {
    let posterPath: String?
    let id: Int
    let overview: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case id
        case overview
        case title
    }
}


import Foundation

struct person: Decodable {
    let name: String
    let gender: String
}
enum CodingKeys: String, CodingKey {
    case name, gender
}

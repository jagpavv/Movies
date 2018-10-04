import Foundation
import SwiftyJSON

struct ResultsInfo {
  let vote_count: Int
  let id: Int
  let video: Bool
  let vote_average: Float
  let title: String?
  let popularity: Float
  let poster_path: String?
  let original_language: String?
  let original_title: String?
  let genre_ids: Array<JSON>? // return optional([Array])
  let backdrop_path: String?
  let adult: Bool
  let overview: String?
  let release_date: String?


  init(json: JSON) {
    self.vote_count = json["vote_count"].intValue
    self.id = json["id"].intValue
    self.video = json["video"].boolValue
    self.vote_average = json["vote_average"].floatValue
    self.title = json["title"].stringValue
    self.popularity = json["popularity"].floatValue
    self.poster_path = json["poster_path"].stringValue
    self.original_language = json["original_language"].stringValue
    self.original_title = json["original_title"].stringValue
    self.genre_ids = json["genre_ids"].arrayValue
    self.backdrop_path = json["backdrop_path"].stringValue
    self.adult = json["adult"].boolValue
    self.overview = json["overview"].stringValue
    self.release_date = json["release_date"].stringValue

    print(title!)
    print(poster_path!)
    print(overview)
    print(release_date)

  }
}

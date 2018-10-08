import SwiftyJSON
import Foundation

struct MovieInfo { // from "results"
  let title: String?
  let poster_path: String?
  let overview: String?
  let release_date: String?

  init(json: JSON) {
    self.title = json["title"].stringValue
    self.poster_path = json["poster_path"].stringValue
    self.overview = json["overview"].stringValue
    self.release_date = json["release_date"].stringValue
  }
}

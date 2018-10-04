import UIKit
import Alamofire
import SwiftyJSON
import Foundation

class ViewController: UIViewController {

  let parameters: Parameters = [
    "api_key": "2696829a81b1b5827d515ff121700838",
    "query": "batman",
    "page": 1
  ]

  override func viewDidLoad() {
    super.viewDidLoad()

    Alamofire.request("http://api.themoviedb.org/3/search/movie", method: .get, parameters: parameters).validate().responseJSON { response in
      switch response.result {
      case .success(let value):
        let json = JSON(value)
//        print("JSON: \(json)")

        TotalInfo.init(json: json)

        /* 이하 json["results"][num]["title"] -> results > title만 빼냄
        let totalCount = json ["results"].count
        print(totalCount)

        for num in 0..<json ["results"].count {
          let movieTitle = json["results"][num]["title"]
          print("movieTitle \(num): \(movieTitle)")
        }
*/
      case .failure(let error):
        print(error)
      }
    }
  }
}

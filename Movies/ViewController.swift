import UIKit
import Alamofire

class ViewController: UIViewController {

  let parameters: Parameters = [
    "api_key": "2696829a81b1b5827d515ff121700838",
    "query": "batman",
    "page": 1
  ]

  override func viewDidLoad() {
    super.viewDidLoad()

    Alamofire.request("http://api.themoviedb.org/3/search/movie", parameters: parameters).responseString { (response) in
      print(response)
    }
  }


}


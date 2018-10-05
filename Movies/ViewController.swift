import UIKit
import Alamofire
import SwiftyJSON
import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var suggestList: UITableView!

  var moiveData = [MovieInfo]()
  let sugesstSearchResult = ["Batman", "Batman begins", "Batman & Robin"]

  let parameters: Parameters = [
    "api_key": "2696829a81b1b5827d515ff121700838",
    "query": "batman",
    "page": 1
  ]

  override func viewDidLoad() {
    super.viewDidLoad()

    // get data from API
    Alamofire.request("http://api.themoviedb.org/3/search/movie", method: .get, parameters: parameters).validate().responseJSON { response in
      switch response.result {
      case .success(let value):
        let json = JSON(value)

        for v in json["results"].arrayValue {
          let a = MovieInfo.init(json: v)
          self.moiveData.append(a)
        }
        print(self.moiveData)

      case .failure(let error):
        print(error)
      }
    }
  }

  // searchBar
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    print("yeah")
  }

  // suggest list table view
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sugesstSearchResult.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let sugesstSearchResult = self.sugesstSearchResult[indexPath.row]

    let cell = tableView.dequeueReusableCell(withIdentifier: "suggestCell") as! SuggestCell
    cell.fillLabel(data: sugesstSearchResult)
    return cell
  }
}

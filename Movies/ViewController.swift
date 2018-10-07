import UIKit
import Alamofire
import SwiftyJSON
import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var searchTableView: UITableView!
  

  var moiveData = [MovieInfo]()
  private var selectedMoiveData: MovieInfo?

  let searchController = UISearchController(searchResultsController: nil)
//  let sugesstSearchResult = ["Batman", "Batman begins", "Batman & Robin", "Batman", "Batman begins", "Batman & Robin"]
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
//        print(self.moiveData)
        self.searchTableView.reloadData()

      case .failure(let error):
        print(error)
      }
    }

//    searchTableView.dataSource = self
//    searchTableView.delegate = self

//    let nibName = UINib(nibName: "SuggestCell", bundle: nil)
//    searchTableView.register(nibName, forCellReuseIdentifier: "suggestCell")
//
//    let nibName1 = UINib(nibName: "BlankCell", bundle: nil)
//    searchTableView.register(nibName1, forCellReuseIdentifier: "blankCell")

    let infoCellNibName = UINib(nibName: "InfoCell", bundle: nil)
    searchTableView.register(infoCellNibName, forCellReuseIdentifier: "infoCell")
  }

  // searchBar

  // suggest list table view
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return moiveData.count

// suggest
//      return sugesstSearchResult.count
  }



  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let movieData = self.moiveData[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as! InfoCell
    cell.fillLable(data: movieData)


    if let imgURL = URL(string: "http://image.tmdb.org/t/p/w92/kBf3g9crrADGMc2AMAMlLBgSm2h.jpg") {
      let img = try? Data(contentsOf: imgURL)
      if let img = img {
        let image = UIImage(data: img)
        cell.imageView?.image = image
//        cell.fillImg(image: image)

      }

    }






    return cell

// suggest
//      let sugesstSearchResult = self.sugesstSearchResult[indexPath.row]
//      let cell = tableView.dequeueReusableCell(withIdentifier: "suggestCell") as! SuggestCell
//      cell.fillLabel(suggest: sugesstSearchResult)
//      return cell
  }
}

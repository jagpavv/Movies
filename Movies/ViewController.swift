import UIKit
import Alamofire
import SwiftyJSON
import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var searchTableView: UITableView!

  var moiveData = [MovieInfo]()
  private var selectedMoiveData: MovieInfo?
  var filteredMovieData = [MovieInfo]()

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


    let infoCellNibName = UINib(nibName: "InfoCell", bundle: nil)
    searchTableView.register(infoCellNibName, forCellReuseIdentifier: "infoCell")
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return moiveData.count
  }


  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let movieData = self.moiveData[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as! InfoCell
    cell.fillLable(data: movieData)
//    cell.textLabel?.text = nil

    if let posterPath = self.moiveData[indexPath.row].poster_path {
      if let imgURL = URL(string: "http://image.tmdb.org/t/p/w185/" + "\(posterPath)") {
        DispatchQueue.global().async {
          let img = try? Data(contentsOf: imgURL) // Data(contentsOf:) method will download the contents of the url synchronously in the same thread the code is being executed, so do not invoke this in the main thread of your application.
          if let img = img {
            let image = UIImage(data: img)
            DispatchQueue.main.async {
              cell.imageView?.image = image
              self.searchTableView.reloadData()
            }
          }
        }
      }
    }
    return cell
  }
}

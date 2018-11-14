import UIKit
import Alamofire
import SwiftyJSON
import Foundation
import Kingfisher

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var searchTableView: UITableView!

  var moiveData = [MovieInfo]()
  private var selectedMoiveData: MovieInfo?
  var currentMovieData = [MovieInfo]()
  var isSearching = false

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
        self.currentMovieData = self.moiveData
        //        print(self.moiveData)
        self.searchTableView.reloadData()

      case .failure(let error):
        print(error)
      }
    }
    self.searchTableView.estimatedRowHeight = 88.0
    self.searchTableView.rowHeight = UITableView.automaticDimension

    noResultLabel.isHidden = true
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    if isSearching {
      return currentMovieData.count
    } else {
      return moiveData.count
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


    if isSearching {

      let movieData = self.currentMovieData[indexPath.row]
      let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as! InfoCell
      cell.fillLable(data: movieData)

      if let posterPath = self.currentMovieData[indexPath.row].poster_path {
        guard let url = URL(string: "http://image.tmdb.org/t/p/w185/" + "\(posterPath)") else {
          return cell
        }
        cell.poster.kf.setImage(with: url)

        if let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil) {
          if let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as Dictionary? {
            let pixelWidth = imageProperties[kCGImagePropertyPixelWidth] as! CGFloat
            let pixelHeight = imageProperties[kCGImagePropertyPixelHeight] as! CGFloat

            cell.imageWidthConstraint.constant = pixelWidth
            cell.imageHeightConstraint.constant = pixelHeight
          }
        }
      }
      return cell
    } else {
      let movieData = self.moiveData[indexPath.row]
      let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as! InfoCell
      cell.fillLable(data: movieData)

      if let posterPath = self.moiveData[indexPath.row].poster_path {
        guard let url = URL(string: "http://image.tmdb.org/t/p/w185/" + "\(posterPath)") else {
          return cell
        }
        cell.poster.kf.setImage(with: url)

        if let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil) {
          if let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as Dictionary? {
            let pixelWidth = imageProperties[kCGImagePropertyPixelWidth] as! CGFloat
            let pixelHeight = imageProperties[kCGImagePropertyPixelHeight] as! CGFloat

            cell.imageWidthConstraint.constant = pixelWidth
            cell.imageHeightConstraint.constant = pixelHeight
          }
        }
      }
      return cell
    }
  }

  //  search bar
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    if (searchBar.text?.isEmpty)! {
      noTextInSearchBar()
    } else {
      currentMovieData = moiveData.filter({ (t) -> Bool in
        guard let text = searchBar.text else { return false }
        print(text)
        isSearching = true
        return (t.title?.contains(text))!
      })
      searchTableView.reloadData()
    }
  }

  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    noTextInSearchBar()
  }

  func noTextInSearchBar() {
    isSearching = false
    searchBar.text? = ""
    searchTableView.reloadData()
  }
}

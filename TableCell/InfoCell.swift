import UIKit

class InfoCell: UITableViewCell {

  @IBOutlet weak var movieTitleLabel: UILabel!
  @IBOutlet weak var releaseDateLabel: UILabel!
  @IBOutlet weak var overviewLabel: UILabel!
  @IBOutlet weak var poster: UIImageView!


  var posterPath: String?

  func fillLable(data: MovieInfo) {
    self.movieTitleLabel.text = data.title
    self.releaseDateLabel.text = data.release_date
    self.overviewLabel.text = data.overview

    self.posterPath = data.poster_path
  }


//  if let posterPath = self.moiveData[indexPath.row].poster_path {
//    if let imgURL = URL(string: "http://image.tmdb.org/t/p/w185/" + "\(posterPath)") {
//      DispatchQueue.global().async {
//        let img = try? Data(contentsOf: imgURL) // Data(contentsOf:) method will download the contents of the url synchronously in the same thread the code is being executed, so do not invoke this in the main thread of your application.
//        if let img = img {
//          let image = UIImage(data: img)
//          DispatchQueue.main.async {
//            cell.imageView?.image = image
//          }
//        }
//      }
//    }
//  }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

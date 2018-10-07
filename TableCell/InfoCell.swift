import UIKit

class InfoCell: UITableViewCell {

  @IBOutlet weak var movieTitleLabel: UILabel!
  @IBOutlet weak var releaseDateLabel: UILabel!
  @IBOutlet weak var overviewLabel: UILabel!
  @IBOutlet weak var poster: UIImageView!

  func fillLable(data: MovieInfo) {
    self.movieTitleLabel.text = data.title
    self.releaseDateLabel.text = data.release_date
    self.overviewLabel.text = data.overview
  }

//  func fillImg(image: UIImage) {
//    self.poster.image = image
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

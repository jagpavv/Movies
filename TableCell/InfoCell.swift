import UIKit

class InfoCell: UITableViewCell {

  @IBOutlet weak var movieTitleLabel: UILabel!
  @IBOutlet weak var releaseDateLabel: UILabel!
  @IBOutlet weak var overviewLabel: UILabel!
  @IBOutlet weak var poster: UIImageView!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  func fillLable(data: MovieInfo) {
    self.movieTitleLabel.text = data.title
    self.releaseDateLabel.text = data.release_date
    self.overviewLabel.text = data.overview
  }

  override func prepareForReuse() {
    super.prepareForReuse()

    self.movieTitleLabel.text = nil
    self.releaseDateLabel.text = nil
    self.overviewLabel.text = nil
    self.poster.image = nil
  }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
  
}

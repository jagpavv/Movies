import UIKit

class SuggestCell: UITableViewCell {

  @IBOutlet weak var suggestLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  func fillLabel(suggest: String) {
    self.suggestLabel.text = suggest
  }
}

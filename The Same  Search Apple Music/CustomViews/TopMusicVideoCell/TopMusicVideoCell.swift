//
//  TopMusicVideoCell.swift
//  The Same  Search Apple Music
//
//  Created by Abdallah on 1/7/22.
//

import UIKit
 import SDWebImage

class TopMusicVideoCell: UITableViewCell {

    @IBOutlet weak var imageArtist: UIImageView!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func set(result:DataResult){
        imageArtist.sd_setImage(with: URL(string: result.artworkUrl100 ?? ""))
        trackName.text = result.trackName
        dateLabel.text = result.releaseDate?.convertToDisplayFormat()
    }
}

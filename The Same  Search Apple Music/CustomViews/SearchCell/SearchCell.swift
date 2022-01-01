//
//  SearchCell.swift
//  Apple Music
//
//  Created by Abdallah on 8/21/21.
//

import UIKit
import SDWebImage
class SearchCell: UITableViewCell {

    @IBOutlet weak var avaterImage: UIImageView!
    @IBOutlet weak var nameArtist: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    override func layoutSubviews() {
          super.layoutSubviews()
          contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom:5, right: 10))
      }
   

   
    func set(result:DataResult){
        avaterImage.sd_setImage(with:URL(string: result.artworkUrl100 ?? "") )
        nameArtist.text = result.artistName
        typeLabel.text = result.trackName
    }
    
}

//
//  TopMusicVideoTableView.swift
//  The Same  Search Apple Music
//
//  Created by Abdallah on 1/5/22.
//

import UIKit
import AVKit
import SDWebImage
class TopMusicVideoTableView: UITableViewController {

  
        @IBOutlet weak var trackNameLabel: UILabel!
        @IBOutlet weak var musicVideoView: UIView!
        @IBOutlet weak var stopButton: UIButton!
        @IBOutlet weak var trackPrice: UILabel!
        @IBOutlet weak var releaseDate: UILabel!
        @IBOutlet weak var country: UILabel!
        @IBOutlet weak var primaryGenreName: UILabel!
        @IBOutlet weak var palyButton: UIButton!
        
        
        var musicVideoDetails: DataResult?
//        {
//            didSet{
//                title  = musicVideoDetails?.artistName
//                trackNameLabel.text = musicVideoDetails?.trackName
//                fetchUrlMusicVideo(urlString: musicVideoDetails?.previewUrl ?? "")
//                urlArtistMusic   = musicVideoDetails?.artistViewUrl ?? ""
//                country.text = musicVideoDetails?.country
//                primaryGenreName.text = musicVideoDetails?.primaryGenreName
//                trackPrice.text = "\(String(musicVideoDetails?.trackPrice ?? 0 )) $"
//                releaseDate.text = musicVideoDetails?.releaseDate?.convertToDisplayFormat()
//            }
//        }
        
        var urlArtistMusic = ""

        var avpController = AVPlayerViewController()
        var player: AVPlayer?
        
        var headerView: UIView!
        let headerHeight: CGFloat = 300
        

        
     
        override func viewDidLoad() {
            super.viewDidLoad()
            title  = musicVideoDetails?.artistName

        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            print(musicVideoDetails?.trackName)
            print(musicVideoDetails?.trackName)
            print(musicVideoDetails?.trackName)
            print(musicVideoDetails?.artistViewUrl)
            print(musicVideoDetails?.primaryGenreName)
            print(musicVideoDetails?.trackPrice )
            print(musicVideoDetails?.releaseDate?.convertToDisplayFormat())
          
        }
        
        
      
        
//        fileprivate func contingDataView() {
//            trackNameLabel.text = musicVideoDetails?.trackName ?? ""
//            fetchUrlMusicVideo(urlString: musicVideoDetails?.previewUrl ?? "")
//            urlArtistMusic   = musicVideoDetails?.artistViewUrl ?? ""
//            country.text = musicVideoDetails?.country ?? ""
//            primaryGenreName.text = musicVideoDetails?.primaryGenreName ?? ""
//            trackPrice.text = "\(String(musicVideoDetails?.trackPrice ?? 0 )) $"
//            releaseDate.text = musicVideoDetails?.releaseDate?.convertToDisplayFormat()
//        }
//
//
        func fetchUrlMusicVideo(urlString : String){
            guard  let url = URL(string:urlString) else {return}
            player = AVPlayer(url: url)
            avpController.player = player
            avpController.view.frame.size.height = musicVideoView.frame.size.height
            avpController.view.frame.size.width = musicVideoView.frame.size.width
            self.musicVideoView.addSubview(avpController.view)
        }
        
        
        @IBAction func playButtonAction(_ sender: Any) {
            palyButton.isEnabled  = false
            stopButton.isEnabled  = true
            player?.play()
        }
        
        
        @IBAction func stopButtonAction(_ sender: Any) {
            palyButton.isEnabled  = true
            stopButton.isEnabled  = false
            player?.pause()
            
        }
        
        
        @IBAction func artistUrlAction(_ sender: Any) {
            goSafari(urlString: urlArtistMusic)
        }
     

}

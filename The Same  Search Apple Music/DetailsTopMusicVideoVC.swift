//
//  TopMusicVideoVC.swift
//  The Same  Search Apple Music
//
//  Created by Abdallah on 1/5/22.
//

import UIKit
import AVKit
import SDWebImage
class DetailsTopMusicVideoVC: UIViewController {

    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var musicVideoView: UIView!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var trackPrice: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var primaryGenreName: UILabel!
    @IBOutlet weak var palyButton: UIButton!
    
    
    var musicVideoDetails: DataResult?
        {
            didSet{
                title  = musicVideoDetails?.artistName
            }
        }
    
    var urlArtistMusic = ""
    var trackName : String?
    var avpController = AVPlayerViewController()
    var player: AVPlayer?

    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        contingDataView()
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
   
    }
    
  
    
    fileprivate func contingDataView() {
        trackNameLabel.text = musicVideoDetails?.trackName ?? ""
        fetchUrlMusicVideo(urlString: musicVideoDetails?.previewUrl ?? "")
        urlArtistMusic   = musicVideoDetails?.artistViewUrl ?? ""
        country.text = musicVideoDetails?.country ?? ""
        primaryGenreName.text = musicVideoDetails?.primaryGenreName ?? ""
        trackPrice.text = "\(String(musicVideoDetails?.trackPrice ?? 0 )) $"
        releaseDate.text = musicVideoDetails?.releaseDate?.convertToDisplayFormat()
    }


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

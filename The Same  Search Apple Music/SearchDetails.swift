//
//  SearchDetails.swift
//  Apple Music
//
//  Created by Abdallah on 8/22/21.
//

import UIKit
import AVKit
import SDWebImage

class SearchDetails: UIViewController {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var nameArtist: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var musicVideoView: UIView!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var trackPrice: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var primaryGenreName: UILabel!
    @IBOutlet weak var palyButton: UIButton!
    
    
    var msuicName = [DataResult]()
    var musicDetails: DataResult?
    var urlArtistMusic = ""

    var avpController = AVPlayerViewController()
    var player: AVPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchMusicData()
    }
    
    
    fileprivate func fetchMusicData() {
        artistImage.sd_setImage(with: URL(string: musicDetails?.artworkUrl100 ?? ""))
        nameArtist.text = musicDetails?.artistName
        trackNameLabel.text = musicDetails?.trackName
        fetchUrlMusicVideo(urlString: musicDetails?.previewUrl ?? "")
        urlArtistMusic   = musicDetails?.artistViewUrl ?? ""
        country.text = musicDetails?.country
        primaryGenreName.text = musicDetails?.primaryGenreName
        trackPrice.text = "\(String(musicDetails?.trackPrice ?? 0 )) USD"
        releaseDate.text = musicDetails?.releaseDate?.convertToDisplayFormat()
        showLoadingView()
        NetworkManger.shared.searchResultMusic(searchText: musicDetails?.artistName ?? "") { [weak self] result in
            guard let self = self else{return}
            self.dismissLoadingView()
            switch result {
            case .success(let response):
                
                self.msuicName = response.results ?? []
                DispatchQueue.main.async {
                    self.CollectionView.reloadData()
                }
                self.dismissLoadingView()
                
            case .failure(_):
                self.dismissLoadingView()
                
            }
        }
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


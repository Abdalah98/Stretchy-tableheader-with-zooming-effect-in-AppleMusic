//
//  SearchDetails.swift
//  Apple Music
//
//  Created by Abdallah on 8/22/21.
//

import UIKit
import AVKit
import SDWebImage




extension TimeInterval {
    var hourMinuteSecondMS: String {
        String(format:"%d:%02d:%02d.%03d", hour, minute, second, millisecond)
    }
    var minuteSecondMS: String {
        String(format:"%d:%02d.%03d", minute, second, millisecond)
    }
    var hour: Int {
        Int((self/3600).truncatingRemainder(dividingBy: 3600))
    }
    var minute: Int {
        Int((self/60).truncatingRemainder(dividingBy: 60))
    }
    var second: Int {
        Int(truncatingRemainder(dividingBy: 60))
    }
    var millisecond: Int {
        Int((self*1000).truncatingRemainder(dividingBy: 1000))
    }
}

class SearchDetails: UITableViewController {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var nameArtist: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var musicVideoView: UIView!
    @IBOutlet weak var trackPrice: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var primaryGenreName: UILabel!
    
    @IBOutlet weak var palyPauseButton: UIButton!
    
    var msuicName = [DataResult]()
    var musicDetails: DataResult?
    
    var urlArtistMusic = ""

    var avpController = AVPlayerViewController()
    var player: AVPlayer?
    
    var headerView: UIView!
    let headerHeight: CGFloat = 300
    

    
 
    override func viewDidLoad() {
        super.viewDidLoad()
       // title  = musicDetails?.artistName
        configureCollection()
        CustomTableHeaderView()
        updateHeader()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchMusicData()
        let tarckTime = musicDetails?.trackTimeMillis
       // let time = tarckTime.minuteSecondMS
     //   print(musicDetails?.trackTimeMillis.toDisplayString())
    }
    
    
   
    fileprivate func fetchMusicData() {
        contingDataView()
        showLoadingView()
        NetworkManger.shared.searchResultMusicVideo(searchText: musicDetails?.artistName ?? "") { [weak self] result in
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
    
    fileprivate func contingDataView() {
        artistImage.sd_setImage(with: URL(string: musicDetails?.artworkUrl100 ?? ""))
        nameArtist.text = musicDetails?.artistName
        trackNameLabel.text = musicDetails?.trackName
        fetchUrlMusicVideo(urlString: musicDetails?.previewUrl ?? "")
        urlArtistMusic   = musicDetails?.artistViewUrl ?? ""
        country.text = musicDetails?.country
        primaryGenreName.text = musicDetails?.primaryGenreName
        trackPrice.text = "\(String(musicDetails?.trackPrice ?? 0 )) $"
        releaseDate.text = musicDetails?.releaseDate?.convertToDisplayFormat()
    }
    
    
    func fetchUrlMusicVideo(urlString : String){
        guard  let url = URL(string:urlString) else {return}
        player = AVPlayer(url: url)
        avpController.player = player

    }
    
   
    
    @IBAction func palyPauseAction(_ sender: Any) {
        if palyPauseButton.isSelected {
        palyPauseButton.setImage(UIImage(named: "pause.fill"), for: .normal)
            player?.pause()

       print("ss")
        }
        palyPauseButton.setImage( UIImage(named: "play.fill"), for: .selected)
        print("ssssssss")
        player?.play()
    }
    
    
    
    @IBAction func artistUrlAction(_ sender: Any) {
        goSafari(urlString: urlArtistMusic)
    }
 
    
    func updateHeader() {
        if tableView.contentOffset.y < -headerHeight {
            headerView.frame.origin.y = tableView.contentOffset.y
            headerView.frame.size.height = -tableView.contentOffset.y
        }
    }

    fileprivate func CustomTableHeaderView() {
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -headerHeight)
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeader()
    }

}


//
//  TopMusicVideoTableView.swift
//  The Same  Search Apple Music
//
//  Created by Abdallah on 1/7/22.
//

import UIKit

class TopMusicVideoTableView: UITableViewController {
 
    var msuicName = [DataResult]()

    var artustName : String?
       override func viewDidLoad() {
           super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Top Music Video"
        configureNIBCell()
        tableViewDesign()
        fetchData()

       }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
   
    }
    
    func fetchData(){
        
        NetworkManger.shared.searchResultMusicVideo(searchText: artustName ?? "") { [weak self] result in
            guard let self = self else{return}
            self.dismissLoadingView()
            switch result {
            case .success(let response):
                
                self.msuicName = response.results ?? []
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                self.dismissLoadingView()
                
            case .failure(_):
                self.dismissLoadingView()
                
            }
        }
    }
    
    
    func configureNIBCell(){
        let nib = UINib(nibName: Constant.topMusicVideoCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Constant.topMusicVideoCell)
    }
    
    
    func tableViewDesign() {
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    override  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msuicName.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.topMusicVideoCell) as! TopMusicVideoCell
        let data = msuicName[indexPath.row]
        cell.set(result: data)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
           let storyBoard: UIStoryboard = UIStoryboard(name: Constant.detailsTopMusicVideo, bundle: nil)
           let vc = storyBoard.instantiateViewController(withIdentifier: Constant.topMusicVideoVC) as! DetailsTopMusicVideoVC
           vc.musicVideoDetails = self.msuicName[indexPath.item]

           self.navigationController?.pushViewController(vc, animated: true)
    }
}

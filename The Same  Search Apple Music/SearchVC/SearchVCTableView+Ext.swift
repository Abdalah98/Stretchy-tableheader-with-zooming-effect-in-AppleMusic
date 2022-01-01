//
//  SearchVCTableView+Ext.swift
//  Apple Music
//
//  Created by Abdallah on 8/23/21.
//

import UIKit
extension SearchVC : UITableViewDataSource , UITableViewDelegate{
    
    
    func configureNIBCell(){
        let nib = UINib(nibName: Constant.searchCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Constant.searchCell)
    }
    
    
    func tableViewDesign() {
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msuicName.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.searchCell) as! SearchCell
        let data = msuicName[indexPath.row]
        cell.set(result: data)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constant.goDetailsMusicVideo, sender: self)
        
    }
    
    //MARK: - prepareSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.goDetailsMusicVideo {
            let detailsController = segue.destination as! SearchDetails
            if let indexPath = tableView.indexPathForSelectedRow {
                detailsController.musicDetails = msuicName[indexPath.row]
            }else{
                return print("error")
            }
        }
    }
}


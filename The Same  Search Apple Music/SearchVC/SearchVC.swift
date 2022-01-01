//
//  ViewController.swift
//  Apple Music
//
//  Created by Abdallah on 8/16/21.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController()
    var msuicName = [DataResult]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.allowsSelection = true
        tableViewDesign()
        configureNIBCell()
        configureSearch()
    }
    
    fileprivate func configureSearch() {
        searchController.searchBar.placeholder = "Search Here"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        
        
    }
    
 
}



//
//  SearchVCSearchDelegate+Ext.swift
//  Apple Music
//
//  Created by Abdallah on 8/23/21.
//

import UIKit

extension SearchVC :UISearchBarDelegate, UISearchControllerDelegate{
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        showLoadingView()
        NetworkManger.shared.searchResultMusic(searchText: searchText) { [weak self] result in
            guard let self = self else{return}
            switch result {
            case .success(let response):
                
                self.msuicName = response.results ?? []
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                self.dismissLoadingView()

            case .failure(let error):
                self.dismissLoadingView()
                
                self.showAlert(withTitle: "Some thing error", withMessage: error.rawValue)
            }
        }
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        msuicName.removeAll()
        self.tableView.reloadData()
        self.dismissLoadingView()

    }
    
}

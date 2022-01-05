//
//  SearchDetailsCollectionView+Ext.swift
//  Apple Music
//
//  Created by Abdallah on 8/23/21.
//

import UIKit
extension SearchDetails : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
   
     func configureCollection(){
        
        let nib = UINib(nibName: Constant.searchDetailsCell, bundle: nil)
        CollectionView.register(nib, forCellWithReuseIdentifier: Constant.searchDetailsCell)
        snapHorizontal()
    }
    
    
     func snapHorizontal(){
        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        CollectionView.decelerationRate = .fast
        let layout = BetterSnappingLayout()
        layout.scrollDirection = .horizontal
        CollectionView.collectionViewLayout = layout
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return msuicName.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.searchDetailsCell, for: indexPath) as! SearchDetailsCell
        cell.set(result: msuicName[indexPath.item])
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 52  , height: 60 )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        performSegue(withIdentifier: Constant.goShowMsuicVideo, sender: self)
//            
//        }
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsController = TopMusicVideoTableView()
        
        detailsController.musicVideoDetails = self.msuicName[indexPath.item]
        navigationController?.pushViewController(detailsController, animated: true)
        
    }
        //MARK: - prepareSegue
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == Constant.goShowMsuicVideo {
//                let detailsController = segue.destination as! TopMusicVideoTableView
//                    detailsController.musicVideoDetails = msuicName
//                }else{
//                    return print("error")
//                }
//            }
//        }
//
//
    
}

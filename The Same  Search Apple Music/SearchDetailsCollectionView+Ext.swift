//
//  SearchDetailsCollectionView+Ext.swift
//  Apple Music
//
//  Created by Abdallah on 8/23/21.
//

import UIKit
extension SearchDetails : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
   
     func configureCollection(){
        CollectionView.delegate = self
        CollectionView.dataSource = self
        let nib = UINib(nibName: Constant.searchDetailsCell, bundle: nil)
        CollectionView.register(nib, forCellWithReuseIdentifier: Constant.searchDetailsCell)
        snapHorizontal()
    }
    
    
     func snapHorizontal(){
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
    
}

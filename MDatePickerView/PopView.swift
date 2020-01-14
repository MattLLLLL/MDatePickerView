//
//  PopView.swift
//  MDatePickerView
//
//  Created by Matt on 2020/1/14.
//  Copyright © 2020 Matt. All rights reserved.
//

import UIKit

class PopView : UICollectionViewController {
    
    let CellID = "CellID"
    let month = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionView?.register(Cell.self, forCellWithReuseIdentifier: CellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID, for: indexPath) as! Cell
        cell.Label.text = month[indexPath.row]
        return cell
    }
}

extension PopView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 3) - 8, height: (collectionView.frame.width / 3) - 8)
    }
}


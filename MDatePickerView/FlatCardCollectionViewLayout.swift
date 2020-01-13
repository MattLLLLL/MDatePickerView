//
//  FlatCardCollectionViewLayout.swift
//  MDatePickerView
//
//  Created by Matt on 2020/1/9.
//  Copyright © 2020 Matt. All rights reserved.
//

import UIKit

class FlatCardCollectionViewLayout: UICollectionViewFlowLayout {
    
    
    override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        if collectionView == nil { return nil }
        
        guard let superArray = super.layoutAttributesForElements(in: rect) else { return nil }
        
        guard let attributes = NSArray(array: superArray, copyItems: true) as? [UICollectionViewLayoutAttributes] else { return nil }
        
        let centerX = collectionView!.contentOffset.x + collectionView!.bounds.width / 2.0
        
        for attribute in attributes {
            
            let delta = Swift.abs(attribute.center.x - centerX)
            
            let scale = 1 - (delta * 1.6) / collectionView!.frame.size.width
            
            attribute.transform = CGAffineTransform(scaleX: scale, y: scale);
            
        }
        return attributes
    }
    
    override open func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

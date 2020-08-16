//
//  PaginationLayout.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 14.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

public class PaginationLayout: UICollectionViewFlowLayout {
    
    // MARK: - Props
    var insertingTopCells: Bool = false
    var sizeForTopInsertions: CGSize = CGSize.zero
    
    override public func prepare() {
        super.prepare()
        
        let oldSize: CGSize = sizeForTopInsertions
        
        if self.insertingTopCells {
            guard let customCollectionView = collectionView else { return }
            let newSize: CGSize = collectionViewContentSize
            let xOffset: CGFloat = customCollectionView.contentOffset.x + (newSize.width - oldSize.width)
            let newOffset: CGPoint = CGPoint(x: xOffset, y: customCollectionView.contentOffset.y)
            customCollectionView.contentOffset = newOffset
        } else {
            insertingTopCells = false
        }
        sizeForTopInsertions = collectionViewContentSize
    }
    
    
    
    
    //  configuring the content offsets relative to the scroll velocity
    
    
    //  Solution provided by orlandoamorim
    
    var lastPoint: CGPoint = CGPoint.zero
    
    //  configuring the content offsets relative to the scroll velocity
    override public func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let customCollectionView = collectionView else { return proposedContentOffset }
        guard let layoutAttributes: Array = layoutAttributesForElements(in: customCollectionView.bounds) else { return proposedContentOffset }
        
        if layoutAttributes.isEmpty {
            return proposedContentOffset
        }
        var targetIndex = layoutAttributes.count / 2
        
        // Skip to the next cell, if there is residual scrolling velocity left.
        // This helps to prevent glitches
        let velocityX = velocity.x
        
        if velocityX > 0 {
            targetIndex += 1
        } else if velocityX < 0.0 {
            targetIndex -= 1
        } else if velocityX == 0 {
            return lastPoint
        }
        
        if targetIndex >= layoutAttributes.count {
            targetIndex = layoutAttributes.count - 1
        }
        
        if targetIndex < 0 {
            targetIndex = 0
        }
        
        let targetAttribute = layoutAttributes[targetIndex]
        
        lastPoint = CGPoint(x: targetAttribute.center.x - customCollectionView.bounds.size.width * 0.5, y: proposedContentOffset.y)
        return lastPoint
    }
}

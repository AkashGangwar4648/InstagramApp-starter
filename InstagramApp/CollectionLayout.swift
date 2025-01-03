//
//  CollectionLayout.swift
//  InstagramApp
//
//  Created by Apple on 02/01/25.
//  Copyright © 2025 Gwinyai Nyatsoka. All rights reserved.
//

import Foundation

import UIKit

class CollectionLayout: UICollectionViewLayout {
    
    fileprivate var numberOfColums: Int = 3
    
    fileprivate var cellPadding: CGFloat = 3
    
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    fileprivate var contentWidth: CGFloat {
        
        guard let collectionView = collectionView else {
            
            return 0
            
        }
        
        let insets = collectionView.contentInset
        
        return collectionView.bounds.width - (insets.left + insets.right) - (cellPadding * (CGFloat(numberOfColums) - 1))
        
    }
    
    fileprivate var contentHeight: CGFloat = 0
    
    override var collectionViewContentSize: CGSize {
        
        return CGSize(width: contentWidth, height: contentHeight)
        
    }
    
    override func prepare() {
        
        guard cache.isEmpty == true, let collectionView = collectionView else {
            
            return
            
        }
        
        let itemsPerRow: Int = 3
        
        let normalColumWidth: CGFloat = contentWidth / CGFloat(itemsPerRow)
        
        let normalColumHeight: CGFloat = normalColumWidth
        
        let featuredColumWidth: CGFloat = (normalColumWidth * 2) + cellPadding
        
        let featuredColumHeight: CGFloat = featuredColumWidth
        
        var xoffsets: [CGFloat] = [CGFloat]()
        
        for item in 0..<6 {
            
            let multiplier = item % 3
            
            let xPos = CGFloat(multiplier) * (normalColumWidth + cellPadding)
            
            xoffsets.append(xPos)
            
        }
        
        xoffsets.append(0.0)
        
        for _ in 0..<2 {
            
            xoffsets.append(featuredColumWidth + cellPadding)
            
        }
        
        var yOffsets: [CGFloat] = [CGFloat]()
        
        for item in 0..<9 {
            
            var _yPos = floor(Double(item / 3)) * (Double(normalColumHeight) + Double(cellPadding))
            
            if item == 8 {
                
                _yPos += (Double(normalColumHeight) + Double(cellPadding))
                
            }
            
            yOffsets.append(CGFloat(_yPos))
            
        }
        
        let numberOfItemsPerSection: Int = 9
        
        let heightOfSection: CGFloat = 4 * normalColumHeight + (4 * cellPadding)
        
        var itemInSection: Int = 0
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            
            let indexPath = IndexPath(item: item, section: 0)
            
            let xPos = xoffsets[itemInSection]
            
            let multiplier: Double = floor(Double(item) / Double(numberOfItemsPerSection))
            
            let yPos = yOffsets[itemInSection] + (heightOfSection * CGFloat(multiplier))
            
            var cellWidth = normalColumWidth
            
            var cellHeight = normalColumHeight
            
            if (itemInSection + 1) % 7 == 0 && itemInSection != 0 {
                
                cellWidth = featuredColumWidth
                
                cellHeight = featuredColumHeight
                
            }
            
            let frame = CGRect(x: xPos, y: yPos, width: cellWidth, height: cellHeight)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            attributes.frame = frame
            
            cache.append(attributes)
            
            contentHeight = max(contentHeight, frame.maxY)
            
            itemInSection = itemInSection < (numberOfItemsPerSection - 1) ? (itemInSection + 1): 0
            
        }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            
            if attributes.frame.intersects(rect) {
                
                visibleLayoutAttributes.append(attributes)
                
            }
            
        }
        
        return visibleLayoutAttributes
        
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        return cache[indexPath.item]
        
    }
    
}

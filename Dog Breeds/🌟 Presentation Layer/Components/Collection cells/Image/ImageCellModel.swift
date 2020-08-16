//
//  ImageCellModel.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 14.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

class ImageCellModel: CollectionCellModel {
    
    // MARK: - Typealias
    typealias Like = (_ imageModel: ImageModel) -> Void
    typealias Share = (_ imageURL: URL) -> Void
    
    // MARK: - Setup functions
    public override var cellIdentifier: String {
        let id = ImageCell.identifier
        return id
    }
    
    public override var cellSize: CGSize {
        let size = CGSize(width: 300, height: 300)
        return size
    }
    
    // MARK: - Props
    let image: ImageModel
    
    var like: Like?
    var share: Share?
    
    // MARK: - Initialization
    init(image: ImageModel) {
        self.image = image
    }
}

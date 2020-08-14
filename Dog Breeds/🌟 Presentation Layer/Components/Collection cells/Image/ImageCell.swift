//
//  ImageCell.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 14.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper
import Kingfisher

class ImageCell: CollectionCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var breedImageView: UIImageView!
    
    // MARK: - Props
    
    // MARK: - Setup functions
    override func setupView() {
        self.apply(.clear())
        self.containerView.apply(.forContent())
    }
    
    override func updateViews() {
        guard let model = self.model as? ImageCellModel else { return }
        
        self.breedImageView.kf.setImage(with: model.imageURL)
    }
    
    // MARK: - Actions
}

// MARK: - Module functions
extension ImageCell { }

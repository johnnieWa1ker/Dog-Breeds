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
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var shareButton: UIButton!
    
    // MARK: - Props
    
    // MARK: - Setup functions
    override func setupView() {
        self.apply(.clear())
        self.containerView.apply(.roundedAllCorners(AppTheme.secondBackground))
        self.breedImageView.contentMode = .scaleAspectFill
        self.breedImageView.clipsToBounds = true
        self.likeButton.apply(.likeButton())
        self.shareButton.apply(.shareButton())
        
        self.likeButton.addTarget(self, action: #selector(self.shareButtonAction), for: .touchUpInside)
        self.shareButton.addTarget(self, action: #selector(self.shareButtonAction), for: .touchUpInside)
    }
    
    override func updateViews() {
        guard let model = self.model as? ImageCellModel else { return }
        
        self.breedImageView.kf.setImage(with: model.image.url)
    }
    
    // MARK: - Actions
    @objc
    func likeButtonAction() {
        guard let model = self.model as? ImageCellModel else { return }
        model.like?(model.image)
    }
    
    @objc
    func shareButtonAction() {
        guard let model = self.model as? ImageCellModel else { return }
        model.share?(model.image.url)
    }
}

// MARK: - Module functions
extension ImageCell { }

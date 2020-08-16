//
//  SubbreedCell.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 16.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper
import GKRepresentable

class SubbreedCell: TableCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var subbreedLabel: UILabel!
    @IBOutlet private weak var previewLabel: UILabel!
    
    // MARK: - Props
    
    // MARK: - Setup functions
    override func setupView() {
        self.apply(.clear())
        self.containerView.apply(.roundedAllCorners(AppTheme.secondBackground))
        self.subbreedLabel.apply(.sfTitle3Semibold20(AppTheme.white, .left))
    }
    
    override func updateViews() {
        guard let model = self.model as? SubbreedCellModel else { return }
        
        self.previewLabel.text = String.randomEmoji()
        self.previewLabel.font = UIFont.systemFont(ofSize: 38.0)
        self.subbreedLabel.text = model.subbreed.capitalized
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }
    
    // MARK: - Actions
}

// MARK: - Module functions
extension SubbreedCell { }

//
//  BreedCell.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper
import GKRepresentable

class BreedCell: TableCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var previewLabel: UILabel!
    @IBOutlet private weak var breedLabel: UILabel!
    @IBOutlet private weak var subbreedLabel: UILabel!
    
    // MARK: - Props
    
    // MARK: - Setup functions
    override func setupView() {
        self.apply(.clear())
        self.containerView.apply(.roundedAllCorners(AppTheme.secondBackground))
        self.breedLabel.apply(.sfTitle3Semibold20(AppTheme.white, .left))
        self.subbreedLabel.apply(.sfBodyRegular14(AppTheme.lightGray, .left))
    }
    
    override func updateViews() {
        guard let model = self.model as? BreedCellModel else { return }
        
        self.previewLabel.text = String.randomEmoji()
        self.previewLabel.font = UIFont.systemFont(ofSize: 38.0)
        self.breedLabel.text = model.breed.capitalized
        
        self.subbreedLabel.text = "Found " + String(model.subbreed.count) + " subbreeds"
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }
    
    // MARK: - Actions
}

// MARK: - Module functions
extension BreedCell { }

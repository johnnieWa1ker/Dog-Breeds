//
//  CollectionCell.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 17.07.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKExtensions

public protocol CollectionCellRepresentable {
    var model: CollectionCellIdentifiable? { get set }
}

open class CollectionCell: UICollectionViewCell, CollectionCellRepresentable {
    
    // MARK: - Props
    public var model: CollectionCellIdentifiable? {
        didSet {
            self.updateViews()
        }
    }
    
    // MARK: - Initialization
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - Setup functions
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupView()
    }
    
    open func setupView() { }
    
    open func updateViews() { }
    
//    override open func setHighlighted(_ highlighted: Bool, animated: Bool) {
//        if highlighted {
//            self.alpha = 0.4
//        } else {
//            self.alpha = 1.0
//        }
//    }
//
//    override open func setSelected(_ selected: Bool, animated: Bool) { }
        
}


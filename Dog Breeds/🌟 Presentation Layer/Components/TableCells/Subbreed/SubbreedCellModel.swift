//
//  SubbreedCellModel.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 16.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit
import GKRepresentable

class SubbreedCellModel: TableCellModel {
    
    // MARK: - Setup functions
    public override var cellIdentifier: String {
        let id = SubbreedCell.identifier
        return id
    }
    
    public override var cellHeight: CGFloat {
        let height = UITableView.automaticDimension
        return height
    }
    
    // MARK: - Props
    let subbreed: String
    
    // MARK: - Initialization
    init(subbreed: String) {
        self.subbreed = subbreed
    }
}

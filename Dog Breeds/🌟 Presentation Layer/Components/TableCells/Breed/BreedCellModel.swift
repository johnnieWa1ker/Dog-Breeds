//
//  BreedCellModel.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit
import GKRepresentable

class BreedCellModel: TableCellModel {
    
    // MARK: - Setup functions
    public override var cellIdentifier: String {
        let id = BreedCell.identifier
        return id
    }
    
    public override var cellHeight: CGFloat {
        let height = UITableView.automaticDimension
        return height
    }
    
    // MARK: - Props
    let breed: String
    let subbreed: [String]
    
    // MARK: - Initialization
    init(breed: String, subbreed: [String]) {
        self.breed = breed
        self.subbreed = subbreed
    }
}

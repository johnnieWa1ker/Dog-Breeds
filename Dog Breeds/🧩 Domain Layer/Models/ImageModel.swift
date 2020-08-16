//
//  ImageModel.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

public class ImageModel {
    
    // MARK: - Props
    var url: URL
    var isFavorite: Bool
    
    // MARK: - Initialization
    init(url: URL, isFavorite: Bool) {
        self.url = url
        self.isFavorite = isFavorite
    }
}

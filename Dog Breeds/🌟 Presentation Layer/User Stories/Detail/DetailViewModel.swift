//
//  DetailViewModel.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

class DetailViewModel: ViperViewModel {
    
    // MARK: - Props
    let breed: String
    let subbreed: String?
    
    // MARK: - Initialization
    init(breed: String, subbreed: String?) {
        self.breed = breed
        self.subbreed = subbreed
    }
}

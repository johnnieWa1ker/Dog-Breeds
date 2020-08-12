//
//  DogModel.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

public class DogModel {
    
    // MARK: - Props
    var breed: String
    var subbreed: [String]
    
    // MARK: - Initialization
    init(breed: String, subbreed: [String]) {
        self.breed = breed
        self.subbreed = subbreed
    }
}


//
//  DogResponse.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKNetwork

class DogResponse: Codable {
    var breeds: [String: [String]]?
    
    enum CodingKeys: String, CodingKey {
        case breeds = "message"
    }
}

extension DogResponse: RemoteMappable {
    func mapResponseToDomain() -> AnyObject? {
                
        guard let breeds = self.breeds else { return nil }
        var result: [DogModel] = []
        for (key, value) in breeds {
            let model = DogModel(breed: key, subbreed: value)
            result.append(model)
        }
        
        return result as AnyObject
    }
}

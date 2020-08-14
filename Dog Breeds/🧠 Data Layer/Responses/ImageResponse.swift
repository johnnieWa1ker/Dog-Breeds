//
//  ImageResponse.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKNetwork

class ImageResponse: Codable {
    var images: [String?]?
    
    enum CodingKeys: String, CodingKey {
        case images = "message"
    }
}

extension ImageResponse: RemoteMappable {
    func mapResponseToDomain() -> AnyObject? {
        
        var result: [ImageModel] = []
        
        guard let images = self.images else { return nil }
        for image in images {
            if let imageURLStr = image {
                if let imageURL = URL(string: imageURLStr) {
                    result.append(ImageModel(url: imageURL))
                }
            }
        }
        return result as AnyObject
    }
}

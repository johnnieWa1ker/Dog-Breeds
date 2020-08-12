//
//  DogDataRouter.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKNetwork

enum DogDataRouter {
    enum Remote {
        case getBreeds
        case getBreedImage(_ breed: String)
        case getSubbreedImage(_ breed: String, _ subbreed: String)
        
        var method: HTTPMethod {
            switch self {
            case .getBreeds, .getBreedImage, .getSubbreedImage:
                return .get
            }
        }
        
        var path: String {
            switch self {
            case .getBreeds:
                return "\(AppConfiguration.serverApi)/breeds/list/all"
            case .getBreedImage(let breed):
                return "\(AppConfiguration.serverApi)/breed/\(breed)/images"
            case let .getSubbreedImage(breed, subbreed):
                return "\(AppConfiguration.serverApi)/breed/\(breed)/\(subbreed)/images"
            }
        }
        
        var request: URLRequest? {
            switch self {
            case .getBreeds, .getBreedImage, .getSubbreedImage:
                return RemoteFactory.request(path: self.path, parameters: nil, headers: nil, method: self.method)
            }
        }
    }
}

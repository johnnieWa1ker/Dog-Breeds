//
//  DogRepository.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKUseCase
import GKNetwork

protocol DogRepositoryInterface: RepositoryInterface {
    func getBreeds(completion: @escaping (_ result: [DogModel]?, _ error: Error?) -> Void)
    func getBreedImages(breed: String, completion: @escaping (_ result: [ImageModel]?, _ error: Error?) -> Void)
    func getSubbreedImages(breed: String, subbreed: String, completion: @escaping (_ result: [ImageModel]?, _ error: Error?) -> Void)
}

class DogRepository: DogRepositoryInterface {
    func getBreeds(completion: @escaping ([DogModel]?, Error?) -> Void) {
        
        guard let request = DogDataRouter.Remote.getBreeds.request else {
            completion([], ErrorHelper(title: nil, description: AppLocalization.ErrorMessage.internalServerError.localized, code: ErrorCodes.internalServerError))
            return
        }
        
        RemoteWorker().execute(request, model: DogResponse.self) { (result, response, error) in
            if let mappedResult = result?.mapResponseToDomain() as? [DogModel], error == nil {
                completion(mappedResult, nil)
            } else {
                switch response?.statusCode {
                case 200:
                    completion([], ErrorHelper(title: nil,
                                               description: AppLocalization.ErrorMessage.emptyResult.loc,
                                               code: ErrorCodes.success))
                default:
                    completion([], ErrorHelper(title: nil,
                                               description: AppLocalization.ErrorMessage.internalServerError.loc,
                                               code: ErrorCodes.internalServerError))
                }
            }
        }
    }
    
    func getBreedImages(breed: String, completion: @escaping ([ImageModel]?, Error?) -> Void) {
        
        guard let request = DogDataRouter.Remote.getBreedImage(breed).request else {
            completion(nil, ErrorHelper(title: nil, description: AppLocalization.ErrorMessage.internalServerError.localized, code: ErrorCodes.internalServerError))
            return
        }
        
        RemoteWorker().execute(request, model: ImageResponse.self) { (result, response, error) in
            if let mappedResult = result?.mapResponseToDomain() as? [ImageModel], error == nil {
                completion(mappedResult, nil)
            } else {
                switch response?.statusCode {
                case 200:
                    completion([], ErrorHelper(title: nil,
                                                description: AppLocalization.ErrorMessage.emptyResult.loc,
                                                code: ErrorCodes.success))
                default:
                    completion([], ErrorHelper(title: nil,
                                                description: AppLocalization.ErrorMessage.internalServerError.loc,
                                                code: ErrorCodes.internalServerError))
                }
            }
        }
    }
    
    func getSubbreedImages(breed: String, subbreed: String, completion: @escaping ([ImageModel]?, Error?) -> Void) {
        
        
        guard let request = DogDataRouter.Remote.getSubbreedImage(breed, subbreed).request else {
            completion(nil, ErrorHelper(title: nil, description: AppLocalization.ErrorMessage.internalServerError.localized, code: ErrorCodes.internalServerError))
            return
        }
        
        RemoteWorker().execute(request, model: ImageResponse.self) { (result, response, error) in
            if let mappedResult = result?.mapResponseToDomain() as? [ImageModel], error == nil {
                completion(mappedResult, nil)
            } else {
                switch response?.statusCode {
                case 200:
                    completion(nil, ErrorHelper(title: nil,
                                                description: AppLocalization.ErrorMessage.emptyResult.loc,
                                                code: ErrorCodes.success))
                default:
                    completion(nil, ErrorHelper(title: nil,
                                                description: AppLocalization.ErrorMessage.internalServerError.loc,
                                                code: ErrorCodes.internalServerError))
                }
            }
        }
    }
    
    // MARK: - Props
    
    // MARK: - DogRepositoryInterface
    
    // MARK: - Module functions
}

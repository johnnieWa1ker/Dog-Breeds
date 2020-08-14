//
//  DogUseCase.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKUseCase

protocol DogUseCaseInput: UseCaseInput {
    func getBreeds()
    func getImageOfBreed(_ breed: String)
    func getImageOfSubbreed(_ breed: String, _ subbreed: String)
}

protocol DogUseCaseOutput: UseCaseOutput {
    func provideBreeds(_ result: [DogModel])
    func provideImage(_ result: [ImageModel])
    func provideError(_ error: Error)
    func noInternetConnection()
}

extension DogUseCaseOutput {
    func provideBreeds(_ result: [DogModel]) { }
    func provideImage(_ result: [ImageModel]) { }
    func provideError(_ error: Error) { }
}

class DogUseCase: UseCase, DogUseCaseInput {
    
    // MARK: - Props
    private var output: DogUseCaseOutput? {
        guard let output = self._output as? DogUseCaseOutput else {
            return nil
        }
        return output
    }
    
    private lazy var dogRepository: DogRepositoryInterface = DogRepository()
    
    // MARK: - Initialization
    override public init() {
        super.init()
    }
    
    // MARK: - DogUseCaseInput
    func getBreeds() {
        guard ReachabilityManager.isConnectedToNetwork() else {
            self.output?.noInternetConnection()
            return
        }
        
        self.dogRepository.getBreeds { (result, error) in
            if let result = result, error == nil {
                self.output?.provideBreeds(result)
            } else if let error = error {
                self.output?.provideError(error)
            }
        }
    }
    
    func getImageOfBreed(_ breed: String) {
        guard ReachabilityManager.isConnectedToNetwork() else {
            self.output?.noInternetConnection()
            return
        }
        
        self.dogRepository.getBreedImages(breed: breed) { (result, error) in
            if let result = result, error == nil {
                self.output?.provideImage(result)
            } else if let error = error {
                self.output?.provideError(error)
            }
        }
    }
    
    func getImageOfSubbreed(_ breed: String, _ subbreed: String) {
        guard ReachabilityManager.isConnectedToNetwork() else {
            self.output?.noInternetConnection()
            return
        }
        
        self.dogRepository.getSubbreedImages(breed: breed, subbreed: subbreed) { (result, error) in
            if let result = result, error == nil {
                self.output?.provideImage(result)
            } else if let error = error {
                self.output?.provideError(error)
            }
        }
    }
}

// MARK: - Module functions
extension DogUseCase { }

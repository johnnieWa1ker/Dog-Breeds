//
//  BreedsRouter.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol BreedsRouterInput: ViperRouterInput {
    func pushToSubbreedOf(_ breed: DogModel)
    func pushToDetailOf(_ breed: String)
}

class BreedsRouter: ViperRouter, BreedsRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: BreedsViewController? {
        guard let mainController = self._mainController as? BreedsViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - BreedsRouterInput
    func pushToSubbreedOf(_ breed: DogModel) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            let vc = SubbreedsAssembly.create()
            _ = SubbreedsAssembly.configure(with: vc,
                                            breed: breed)
            vc.modalPresentationStyle = .fullScreen
            
            strongSelf.push(to: vc, animated: true)
        }
    }
    
    func pushToDetailOf(_ breed: String) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            let vc = DetailAssembly.create()
            _ = DetailAssembly.configure(with: vc,
                                         breed: breed,
                                         subbreed: nil)
            vc.modalPresentationStyle = .fullScreen
            
            strongSelf.push(to: vc, animated: true)
        }
    }
    
    // MARK: - Module functions
}

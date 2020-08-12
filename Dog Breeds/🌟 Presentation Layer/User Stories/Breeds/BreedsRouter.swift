//
//  BreedsRouter.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol BreedsRouterInput: ViperRouterInput {
    func pushToSubbreedOf(breed name: String)
    func pushToDetailOf(breed name: String)
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
    func pushToSubbreedOf(breed name: String) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            let vc = SubbreedsAssembly.create()
            _ = SubbreedsAssembly.configure(with: vc)
            vc.modalPresentationStyle = .fullScreen
            
            strongSelf.push(to: vc, animated: true)
        }
    }
    
    func pushToDetailOf(breed name: String) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            let vc = DetailAssembly.create()
            _ = DetailAssembly.configure(with: vc, breed: name, subbreed: nil)
            vc.modalPresentationStyle = .fullScreen
            
            strongSelf.push(to: vc, animated: true)
        }
    }
    
    // MARK: - Module functions
}

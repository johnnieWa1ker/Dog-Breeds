//
//  SubbreedsRouter.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol SubbreedsRouterInput: ViperRouterInput {
    func pushToDetailOf(_ breed: String, _ subbreed: String)
}

class SubbreedsRouter: ViperRouter, SubbreedsRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: SubbreedsViewController? {
        guard let mainController = self._mainController as? SubbreedsViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - SubbreedsRouterInput
    func pushToDetailOf(_ breed: String, _ subbreed: String) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            let vc = DetailAssembly.create()
            _ = DetailAssembly.configure(with: vc,
                                         breed: breed,
                                         subbreed: subbreed)
            vc.modalPresentationStyle = .fullScreen
            
            strongSelf.push(to: vc, animated: true)
        }
    }
    
    // MARK: - Module functions
}

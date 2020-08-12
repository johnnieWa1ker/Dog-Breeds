//
//  SubbreedsRouter.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol SubbreedsRouterInput: ViperRouterInput { }

class SubbreedsRouter: ViperRouter, SubbreedsRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: SubbreedsViewController? {
        guard let mainController = self._mainController as? SubbreedsViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - SubbreedsRouterInput
    
    // MARK: - Module functions
}

//
//  FavoriteRouter.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol FavoriteRouterInput: ViperRouterInput { }

class FavoriteRouter: ViperRouter, FavoriteRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: FavoriteViewController? {
        guard let mainController = self._mainController as? FavoriteViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - FavoriteRouterInput
    
    // MARK: - Module functions
}

//
//  DetailRouter.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol DetailRouterInput: ViperRouterInput { }

class DetailRouter: ViperRouter, DetailRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: DetailViewController? {
        guard let mainController = self._mainController as? DetailViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - DetailRouterInput
    
    // MARK: - Module functions
}

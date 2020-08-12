//
//  FavoriteAssembly.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

enum FavoriteAssembly {
    
    // Create and return controller
    static func create() -> FavoriteViewController {
        let vc = FavoriteViewController(nibName: FavoriteViewController.identifier, bundle: nil)
        return vc
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: FavoriteViewController) -> FavoritePresenterInput {
        let presenter = FavoritePresenter()
        
        let router = FavoriteRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}

//
//  BreedsAssembly.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

enum BreedsAssembly {
    
    // Create and return controller
    static func create() -> BreedsViewController {
        let vc = BreedsViewController(nibName: BreedsViewController.identifier, bundle: nil)
        return vc
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: BreedsViewController) -> BreedsPresenterInput {
        let presenter = BreedsPresenter()
        
        let router = BreedsRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}

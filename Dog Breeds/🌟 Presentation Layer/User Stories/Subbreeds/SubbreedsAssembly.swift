//
//  SubbreedsAssembly.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

enum SubbreedsAssembly {
    
    // Create and return controller
    static func create() -> SubbreedsViewController {
        let vc = SubbreedsViewController(nibName: SubbreedsViewController.identifier, bundle: nil)
        return vc
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: SubbreedsViewController) -> SubbreedsPresenterInput {
        let presenter = SubbreedsPresenter()
        
        let router = SubbreedsRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}

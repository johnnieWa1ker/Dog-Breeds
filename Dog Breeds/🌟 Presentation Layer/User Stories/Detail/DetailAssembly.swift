//
//  DetailAssembly.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

enum DetailAssembly {
    
    // Create and return controller
    static func create() -> DetailViewController {
        let vc = DetailViewController(nibName: DetailViewController.identifier, bundle: nil)
        return vc
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: DetailViewController, breed: String, subbreed: String?) -> DetailPresenterInput {
        let presenter = DetailPresenter(breed: breed, subbreed: subbreed)
        
        let router = DetailRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}

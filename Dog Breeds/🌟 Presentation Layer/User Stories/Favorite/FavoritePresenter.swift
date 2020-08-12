//
//  FavoritePresenter.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol FavoritePresenterInput: ViperPresenterInput { }

class FavoritePresenter: ViperPresenter, FavoritePresenterInput, FavoriteViewOutput {
    
    // MARK: - Props
    fileprivate var view: FavoriteViewInput? {
        guard let view = self._view as? FavoriteViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var router: FavoriteRouterInput? {
        guard let router = self._router as? FavoriteRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: FavoriteViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = FavoriteViewModel()
    }
    
    // MARK: - FavoritePresenterInput
    
    // MARK: - FavoriteViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
        
    // MARK: - Module functions
}

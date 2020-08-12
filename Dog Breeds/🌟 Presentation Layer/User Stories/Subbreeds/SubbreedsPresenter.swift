//
//  SubbreedsPresenter.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol SubbreedsPresenterInput: ViperPresenterInput { }

class SubbreedsPresenter: ViperPresenter, SubbreedsPresenterInput, SubbreedsViewOutput {
    
    // MARK: - Props
    fileprivate var view: SubbreedsViewInput? {
        guard let view = self._view as? SubbreedsViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var router: SubbreedsRouterInput? {
        guard let router = self._router as? SubbreedsRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: SubbreedsViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = SubbreedsViewModel()
    }
    
    // MARK: - SubbreedsPresenterInput
    
    // MARK: - SubbreedsViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
        
    // MARK: - Module functions
}

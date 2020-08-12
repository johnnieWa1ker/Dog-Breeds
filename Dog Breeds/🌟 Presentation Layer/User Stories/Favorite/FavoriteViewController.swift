//
//  FavoriteViewController.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol FavoriteViewInput: ViperViewInput { }

protocol FavoriteViewOutput: ViperViewOutput { }

class FavoriteViewController: ViperViewController, FavoriteViewInput {

    // MARK: - Outlets
    
    // MARK: - Props
    fileprivate var output: FavoriteViewOutput? {
        guard let output = self._output as? FavoriteViewOutput else { return nil }
        return output
    }
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = AppLocalization.Favorite.title.loc
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
    // MARK: - FavoriteViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension FavoriteViewController { }

// MARK: - Module functions
extension FavoriteViewController { }

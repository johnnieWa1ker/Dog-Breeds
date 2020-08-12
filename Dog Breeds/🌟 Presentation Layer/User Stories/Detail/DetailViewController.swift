//
//  DetailViewController.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol DetailViewInput: ViperViewInput { }

protocol DetailViewOutput: ViperViewOutput { }

class DetailViewController: ViperViewController, DetailViewInput {

    // MARK: - Outlets
    
    // MARK: - Props
    fileprivate var output: DetailViewOutput? {
        guard let output = self._output as? DetailViewOutput else { return nil }
        return output
    }
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
    // MARK: - DetailViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension DetailViewController { }

// MARK: - Module functions
extension DetailViewController { }

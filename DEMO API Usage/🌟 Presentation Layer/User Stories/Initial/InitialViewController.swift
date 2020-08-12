//
//  InitialViewController.swift
//  DEMO API Usage
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol InitialViewInput: ViperViewInput { }

protocol InitialViewOutput: ViperViewOutput { }

class InitialViewController: ViperViewController, InitialViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var logoImageView: UIImageView!
    
    // MARK: - Props
    fileprivate var output: InitialViewOutput? {
        guard let output = self._output as? InitialViewOutput else { return nil }
        return output
    }
    
    // MARK: - Lifecycle
    override var preferredStatusBarStyle: UIStatusBarStyle {
        let style = UIStatusBarStyle.lightContent
        return style
    }
    
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = "".loc
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.backgroundImageView.image = AppAssets.appBackground
        self.logoImageView.image = AppAssets.appLogo
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.apply(.asBackground())
    }
    
    // MARK: - InitialViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension InitialViewController { }

// MARK: - Animations
extension InitialViewController { }

// MARK: - Module functions
extension InitialViewController { }

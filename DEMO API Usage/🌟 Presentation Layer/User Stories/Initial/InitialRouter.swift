//
//  InitialRouter.swift
//  DEMO API Usage
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol InitialRouterInput: ViperRouterInput {
    func presentMainViewController()
}

class InitialRouter: ViperRouter, InitialRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: InitialViewController? {
        guard let mainController = self._mainController as? InitialViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - InitialRouterInput
    func presentMainViewController() {
//        let vc = MainAssembly.create()
//        _ = MainAssembly.configure(with: vc)
//
//        vc.modalPresentationStyle = .fullScreen
//
//        self.present(vc, animated: false)
    }
    
    // MARK: - Module functions
}

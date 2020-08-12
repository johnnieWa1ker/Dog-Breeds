//
//  ViperViewController.swift
//  DEMO API Usage
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

extension ViperViewController {
    
    // Overlays a new view on the current screen that prevents interaction with the current content until the Internet is available.
    func showDisconnect() {
        for view in self.view.subviews {
            if view.isKind(of: DisconnectView.self) {
                view.removeFromSuperview()
            }
        }
        self.view.layoutIfNeeded()
        self.tabBarController?.tabBar.isHidden = true
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.view.endEditing(true)
        
        let view = DisconnectView(frame: self.view.bounds)
        self.view.addSubview(view)
        view.delegate = self
    }
    
    // Remove the view that reported internet problems.
    func hideDisconnect() {
        for view in self.view.subviews {
            if view.isKind(of: DisconnectView.self) {
                view.removeFromSuperview()
                
                self.navigationController?.setNavigationBarHidden(false, animated: true)
                self.tabBarController?.tabBar.isHidden = false
            }
        }
    }
}

extension ViperViewController: DisconnectViewDelegate {
    func reload() {
        self._output?.reloadData()
    }
}

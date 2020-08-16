//
//  BasicNavigationController.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

class BasicNavigationController: UINavigationController {
    
    class func create(with rootController: UIViewController) -> BasicNavigationController {
        let nc = BasicNavigationController(rootViewController: rootController)
        return nc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    private func setupUI() {
        self.navigationBar.isTranslucent = true
        self.navigationBar.backgroundColor = AppTheme.mainBackground
        self.navigationBar.isUserInteractionEnabled = true
        self.navigationBar.tintColor = AppTheme.mainAccent
        self.navigationBar.titleTextAttributes = [.font: SFPRO.bold.font(size: 16), .foregroundColor: AppTheme.mainAccent]
        self.navigationBar.largeTitleTextAttributes =  [.font: SFPRO.bold.font(size: 46), .foregroundColor: AppTheme.white]
        self.navigationBar.prefersLargeTitles = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        let style = AppTheme.statusBarStyle
        return style
    }
    
}

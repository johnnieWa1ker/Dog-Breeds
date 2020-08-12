//
//  AppDelegate.swift
//  DEMO API Usage
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.setup(application)
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.setup(window)
        
        return true
    }

    // MARK: - Application configuration
    private func setup(_ application: UIApplication) {
        
        IQKeyboardManager.shared.enable = true
    }
    
    // MARK: - Window configuration
    private func setup(_ window: UIWindow) {
        let vc = InitialAssembly.create()
        _ = InitialAssembly.configure(with: vc)

        self.window = window
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
}

//
//  AppAssets.swift
//  DEMO API Usage
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

enum AppAssets {
    
    // From this image, the user can find the application on his device
    static var appIcon: UIImage? {
        return UIImage(named: "AppIcon")
    }
    
    // Image for placement on splash screen
    static var appLogo: UIImage? {
        return UIImage(named: "AppLogo")
    }
    
    // MARK: - Backgrounds
    
    //Image for background splash screen
    static var appBackground: UIImage? {
        return UIImage(named: "AppBackground")
    }
    
    // MARK: - Buttons
    
    // MARK: - Icons
    
    static var iconDisconnect: UIImage? {
        let img = UIImage(named: "iconDisconnect")
        return img
    }
    
    // MARK: - Logos
    
    // MARK: - Placeholders
    
    // Image for temporary placement on those screens that have not yet been developed
    static var wipPlaceholder: UIImage? {
        return UIImage(named: "AppWip")
    }
}

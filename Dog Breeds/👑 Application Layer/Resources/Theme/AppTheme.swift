//
//  AppTheme.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKExtensions

enum AppTheme {
    
    // MARK: - Status bar style
    public static var statusBarStyle: UIStatusBarStyle {
        switch AppThemeManager.current.type {
        case .light:
            return .default
        case .dark:
            return .default
        }
    }
    
    // MARK: - Custom colors
    /// Returns one of the colors used in the project. This is the main color for accent buttons / headers / icons and other.
    public static var mainAccent: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return AppTheme.pastelRed
        case .dark:
            return AppTheme.pastelRed
        }
    }
    
    /// Returns one of the colors used in the project. This is the secondary color for alternate buttons and titles.
    public static var secondAccent: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return AppTheme.rajah
        case .dark:
            return AppTheme.rajah
        }
    }
    
    /// Returns one of the colors used in the project. This is the color of the main background used under tables and in other screens.
    public static var mainBackground: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return AppTheme.midnightExpress
        case .dark:
            return AppTheme.midnightExpress
        }
    }
    
    /// Returns one of the colors used in the project. This is the color for cards in the table and other components placed against the main background.
    public static var secondBackground: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return AppTheme.meteorite
        case .dark:
            return AppTheme.meteorite
        }
    }
    
    /// HEX #000000
    public static var black: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "000000", alpha: 1.0)
        case .dark:
            return UIColor(hex: "000000", alpha: 1.0)
        }
    }
    
    /// return UIColor with HEX #000000 and custom alpha chanel
    public static func black(with alpha: Double?) -> UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "000000", alpha: CGFloat(alpha ?? 1.0))
        case .dark:
            return UIColor(hex: "000000", alpha: CGFloat(alpha ?? 1.0))
        }
    }
    
    /// HEX #202040
    public static var midnightExpress: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "202040", alpha: 1.0)
        case .dark:
            return UIColor(hex: "202040", alpha: 1.0)
        }
    }
    
    /// HEX #543864
    public static var meteorite: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "543864", alpha: 1.0)
        case .dark:
            return UIColor(hex: "543864", alpha: 1.0)
        }
    }
    
    /// HEX #FF6363
    public static var pastelRed: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "FF6363", alpha: 1.0)
        case .dark:
            return UIColor(hex: "FF6363", alpha: 1.0)
        }
    }
    
    /// HEX #FFBD69
    public static var rajah: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "FFBD69", alpha: 1.0)
        case .dark:
            return UIColor(hex: "FFBD69", alpha: 1.0)
        }
    }
    
    /// HEX #858B95
    public static var darkGray: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "858B95", alpha: 1.0)
        case .dark:
            return UIColor(hex: "858B95", alpha: 1.0)
        }
    }
    
    /// HEX #ADB2B9
    public static var gray: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "ADB2B9", alpha: 1.0)
        case .dark:
            return UIColor(hex: "ADB2B9", alpha: 1.0)
        }
    }
    
    /// HEX #EEF1F4
    public static var lightGray: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "EEF1F4", alpha: 1.0)
        case .dark:
            return UIColor(hex: "EEF1F4", alpha: 1.0)
        }
    }
    
    /// HEX #FFFFFF
    public static var white: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "FFFFFF", alpha: 1.0)
        case .dark:
            return UIColor(hex: "FFFFFF", alpha: 1.0)
        }
    }
    
    /// return UIColor with HEX #FFFFFF and custom alpha chanel
    public static func white(with alpha: Double?) -> UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "FFFFFF", alpha: CGFloat(alpha ?? 1.0))
        case .dark:
            return UIColor(hex: "FFFFFF", alpha: CGFloat(alpha ?? 1.0))
        }
    }
}

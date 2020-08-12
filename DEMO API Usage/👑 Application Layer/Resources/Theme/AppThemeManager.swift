//
//  AppThemeManager.swift
//  DEMO API Usage
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

enum AppThemeType: String {
    case light = "THEME_LIGHT"
    case dark = "THEME_DARK"
    
    static let base: AppThemeType = .light
    
    init(value: String?) {
        if let value = value {
            switch value {
            case AppThemeType.light.rawValue:
                self = .light
            case AppThemeType.dark.rawValue:
                self = .dark
            default:
                self = AppThemeType.base
            }
        } else {
            self = AppThemeType.base
        }
    }
    
    var key: String {
        let value = self.rawValue
        return value
    }
    
    var title: String {
        switch self {
        case .light:
            return AppLocalization.Theme.light.localized
        case .dark:
            return AppLocalization.Theme.dark.localized
        }
    }
}

class AppThemeManager {
    
    // MARK: - Setup prop
    private static var currentTheme: AppThemeManager {
        let storedThemeData = UserDefaults.standard.string(forKey: AppDefaults.activeTheme)
        let storedTheme = AppThemeType(value: storedThemeData)
        
        if storedThemeData == nil {
            UserDefaults.standard.set(storedTheme.key, forKey: AppDefaults.activeTheme)
        }
        
        return AppThemeManager(currentType: storedTheme)
    }
    
    // MARK: - Initialization
    private init(currentType: AppThemeType) {
        self.currentType = currentType
    }
    
    // MARK: - Accessor
    public static var current: AppThemeManager {
        let theme = self.currentTheme
        return theme
    }
    
    // MARK: - Supported themes
    public static var list: [AppThemeType] {
        let list = [AppThemeType.light, AppThemeType.dark]
        return list
    }
    
    // MARK: - Props
    private var currentType: AppThemeType
    
    public var type: AppThemeType {
        let type = self.currentType
        return type
    }
    
    // MARK: - Public functions
    public func change(theme type: AppThemeType) {
        UserDefaults.standard.set(type.key, forKey: AppDefaults.activeTheme)
    }
}

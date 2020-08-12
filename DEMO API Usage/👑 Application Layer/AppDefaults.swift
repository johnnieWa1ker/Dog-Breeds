//
//  AppDefaults.swift
//  DEMO API Usage
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

enum AppDefaults {
    static let activeTheme: String = "APP_ACTIVE_THEME"
    static let activeLocalization: String =  "APP_ACTIVE_LOCALIZATION"
    
    public static var isTutorialShown: String {
        let value = "IS_TUTORIAL_SHOWN"
        return value
    }
    
    public static var accessToken: String {
        let value = "ACCESS_TOKEN"
        return value
    }
    
    public static var verificationID: String {
        let value = "FIREBASE_VERIFICATION_ID"
        return value
    }
    
    public static var appleIdGivenName: String {
        let value = "APPLE_ID_GIVEN_NAME"
        return value
    }
    
    public static var appleIDFamilyName: String {
        let value = "APPLE_ID_FAMILY_NAME"
        return value
    }
    
    public static var tutorialShown: String {
        let value = "TUTORIAL_SHOWN"
        return value
    }
}

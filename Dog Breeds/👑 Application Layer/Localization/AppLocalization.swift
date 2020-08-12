//
//  AppLocalization.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

enum AppLocalization {
    
    enum Theme: String, Localizable {
        case light                      = "APP_THEME_LIGHT"
        case dark                       = "APP_THEME_DARK"
    }
    
    enum Language: String, Localizable {
        case english                    = "APP_LANG_ENG"
        case russian                    = "APP_LANG_RUS"
    }
    
    enum ErrorMessage: String, Localizable {
        case emptyToken                 = "EM_TOKEN_NOT_FOUND"
        case badRequest                 = "EM_BAD_REQUEST"
        case unauthorized               = "EM_UNAUTHORIZED"
        case internalServerError        = "EM_INTERNAL_SERVER"
        case pushSubscribeFailed        = "EM_PUSH_SUBSCRIBE"
        case pushUnsubscribeFailed      = "EM_PUSH_UNSUBSCRIBE"
        case firebaseAuthError          = "EM_FIREBASE_AUTH"
        case noInternetConnection       = "EM_NO_INTERNET"
        case profileNotFilled           = "EM_PROFILE_NOT_FILLED"
        case userBlocked                = "EM_USER_BLOCKED"
        case phoneNumber                = "EM_PHONE_NUMBER"
        case smsCode                    = "EM_SMS_CODE"
        case failedToSaveData           = "EM_TO_SAVE_DATA"
        case notСompletedError          = "EM_NOT_COMPLETED"
        case popUpInvalidEmail          = "EM_POP_INV_EMAIL"
        case emptyResult                = "EM_EMPTY_RESULT"
        case lowiOSVersion              = "EM_LOW_IOS_VERSION"
    }
    
    enum General: String, Localizable {
        case ok                         = "OK"
        case save                       = "SAVE"
        case cancel                     = "CANCEL"
        case close                      = "CLOSE"
        case attention                  = "ATTENSION"
        case unknown                    = "UNKNOWN"
        case loading                    = "LOADING"
        case refresh                    = "REFRESH"
        case tryAgain                   = "TRY_AGAIN"
        case yes                        = "YES"
        case noo                        = "NO"
        case error                      = "ERROR"
        case warning                    = "WARNING"
        case cont                       = "CONTINUE"
        case search                     = "SEARCH"
        case next                       = "NEXT"
        case confirm                    = "CONFIRM"
        case info                       = "INFO"
        case enter                      = "ENTER"
    }
    
    enum Disconnect: String, Localizable {
        case title                      = "DISCONNECT_TITLE"
    }
    
    enum Breeds: String, Localizable {
        case title                      = "BREEDS_TITLE"
        case tabTitle                   = "BREEDS_TAB_TITLE"
    }
    
    enum Favorite: String, Localizable {
        case title                      = "FAVORITE_TITLE"
        case tabTitle                   = "FAVORITE_TAB_TITLE"
    }
}

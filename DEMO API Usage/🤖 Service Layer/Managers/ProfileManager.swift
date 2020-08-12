//
//  ProfileManager.swift
//  DEMO API Usage
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation
import UIKit

public class ProfileManager: NSObject {
    
    // MARK: - Singleton
    public static let current: ProfileManager = ProfileManager()
    
    // MARK: - Props
//    private var profile: ProfileModel?
    
    // MARK: - Initialization
    private override init() {
        super.init()
    }
    
    // MARK: - Welcome tour
    
    /// A flag that allows you to determine whether the user has been shown instructions for using the application.
    public var isWelcomeTourShown: Bool {
        let value = UserDefaults.standard.bool(forKey: AppDefaults.tutorialShown)
        return value
    }
    
    /// The function allows you to remember that the user saw the introductory instructions for using the application.
    public func welcomeTourViewed() {
        UserDefaults.standard.set(true, forKey: AppDefaults.tutorialShown)
    }
    
    // MARK: - Auth functions
    
    /// If the application requires mandatory token authentication, this function allows you to write it to local storage.
    public func setToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: AppDefaults.accessToken)
    }
    
    /// If the application requires mandatory authentication with a token, this function allows you to take a previously saved token.
    public func getToken() -> String? {
        let token = UserDefaults.standard.object(forKey: AppDefaults.accessToken) as? String
        return token
    }
    
    /// Save on the device the verification ID, which is used to verify the code from SMS
    public func setVerificationId(_ id: String?) {
        UserDefaults.standard.set(id, forKey: AppDefaults.verificationID)
    }
    
    /// Get a previously saved identifier to confirm the SMS authentication code
    public func getVerificationId() -> String? {
        let id = UserDefaults.standard.object(forKey: AppDefaults.verificationID) as? String
        return id
    }
    
    /// Delete all data required for authorization in the application
    public func logout() {
        UserDefaults.standard.removeObject(forKey: AppDefaults.accessToken)
        
        DispatchQueue.main.async {
            let vc = InitialAssembly.create()
            _ = InitialAssembly.configure(with: vc)
            UIApplication.shared.keyWindow?.rootViewController = vc
        }
    }
    
    // MARK: Profile functions
    
    /// Save first and last name data locally (if any)
    /// Applies when registering with an Apple account
    public func setAppleIDFullName(_ value: PersonNameComponents?) {
        UserDefaults.standard.set(value?.givenName, forKey: AppDefaults.appleIdGivenName)
        UserDefaults.standard.set(value?.familyName, forKey: AppDefaults.appleIDFamilyName)
    }
    
    /// Retrieve first and last name data from local storage (if any)
    /// Applies when registering with an Apple account
    public func getAppleIDFullName() -> (givenName: String?, familyName: String?) {
        return (
            UserDefaults.standard.string(forKey: AppDefaults.appleIdGivenName),
            UserDefaults.standard.string(forKey: AppDefaults.appleIDFamilyName)
        )
    }
    
    /// Delete the user's first and last name data from local storage (if any)
    public func removeAppleIDFullName() {
        UserDefaults.standard.removeObject(forKey: AppDefaults.appleIdGivenName)
        UserDefaults.standard.removeObject(forKey: AppDefaults.appleIDFamilyName)
    }
}

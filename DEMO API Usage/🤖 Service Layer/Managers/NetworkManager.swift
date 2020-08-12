//
//  NetworkManager.swift
//  DEMO API Usage
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation
import UIKit

enum NetworkManager {
    
    case contentType
    case authorization
    
    // MARK: - Props
    var key: String {
        switch self {
        case .contentType:
            return "Content-Type"
        case .authorization:
            return "Authorization"
        }
    }
    
    var value: String {
        switch self {
        case .contentType:
            return "application/json"
        case .authorization:
            guard let token = ProfileManager.current.getToken() else {
                return AppLocalization.ErrorMessage.emptyToken.loc
            }
            return ("Bearer \(token)")
        }
    }
    
    // MARK: - Statics
    static func getHeaders() -> [String: String] {
        let contentType = NetworkManager.contentType
        let authorization = NetworkManager.authorization
        print("[DEBUG] TOKEN: \(authorization.value) ")
        return [
            contentType.key: contentType.value,
            authorization.key: authorization.value
        ]
    }
    
    static func openLink(url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

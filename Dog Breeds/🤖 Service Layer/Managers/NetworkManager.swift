//
//  NetworkManager.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation
import UIKit

enum NetworkManager {
    
    case contentType
    
    // MARK: - Props
    var key: String {
        switch self {
        case .contentType:
            return "Content-Type"
        }
    }
    
    var value: String {
        switch self {
        case .contentType:
            return "application/json"
        }
    }
    
    // MARK: - Statics
    static func getHeaders() -> [String: String] {
        let contentType = NetworkManager.contentType
        return [
            contentType.key: contentType.value
        ]
    }
    
    static func openLink(url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

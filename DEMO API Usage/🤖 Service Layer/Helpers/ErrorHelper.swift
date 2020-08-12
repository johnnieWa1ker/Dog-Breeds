//
//  ErrorHelper.swift
//  DEMO API Usage
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

protocol ErrorHelperProtocol: LocalizedError {
    var title: String? { get }
    var code: Int { get }
}

struct ErrorHelper: ErrorHelperProtocol {
    var title: String?
    var code: Int
    var errorDescription: String? { return _description }
    var failureReason: String? { return _description }
    
    private var _description: String
    
    init(title: String?, description: String, code: ErrorCodes) {
        self.title = title ?? "Error"
        self._description = description
        self.code = code.rawValue
        
        print("[DEBUG] ERROR: \(self.code) - \(description)")
    }
    
    init(title: String?, description: String, code: Int) {
        self.title = title ?? "Error"
        self._description = description
        self.code = code
        
        print("[DEBUG] ERROR: \(self.code) - \(description)")
    }
    
    init() {
        self.title = nil
        self._description = ""
        self.code = 0
    }
    
    public func responseHandler<T>(_ response: HTTPURLResponse?, expectedType: T.Type) -> (T?, Error?) {
        switch response?.statusCode {
        case 401:
            return(nil, ErrorHelper(title: nil ,
                                    description: AppLocalization.ErrorMessage.unauthorized.loc,
                                    code: ErrorCodes.unauthorized))
        case 529:
            return(nil, ErrorHelper(title: nil,
                                    description: AppLocalization.ErrorMessage.profileNotFilled.loc,
                                    code: ErrorCodes.profileNotFilled))
        case 525:
            return(nil, ErrorHelper(title: nil,
                                    description: AppLocalization.ErrorMessage.userBlocked.loc,
                                    code: ErrorCodes.userBlocked))
        default:
            return(nil, ErrorHelper(title: nil,
                                    description: AppLocalization.ErrorMessage.internalServerError.loc,
                                    code: ErrorCodes.internalServerError))
        }
    }
}

enum ErrorCodes: Int {
    case success = 200
    case badRequest = 400
    case unauthorized = 401
    case internalServerError = 500
    case profileNotFilled = 529
    case userBlocked = 525
    case pushSubscribeFailed = -100
    case pushUnsubscribeFailed = -101
    case firebaseAuthError = -102
    case noInternetConnection = -103
    
    var code: Int {
        switch self {
        case .success:
            return ErrorCodes.success.rawValue
        case .badRequest:
            return ErrorCodes.badRequest.rawValue
        case .unauthorized:
            return ErrorCodes.unauthorized.rawValue
        case .internalServerError:
            return ErrorCodes.internalServerError.rawValue
        case .profileNotFilled:
            return ErrorCodes.profileNotFilled.rawValue
        case .userBlocked:
            return ErrorCodes.userBlocked.rawValue
        case .pushSubscribeFailed:
            return ErrorCodes.pushSubscribeFailed.rawValue
        case .pushUnsubscribeFailed:
            return ErrorCodes.pushUnsubscribeFailed.rawValue
        case .firebaseAuthError:
            return ErrorCodes.firebaseAuthError.rawValue
        case .noInternetConnection:
            return ErrorCodes.noInternetConnection.rawValue
        }
    }
}

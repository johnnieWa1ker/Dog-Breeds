//
//  LocalMappable.swift
//
//  Created by  Кирилл on 4/12/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation
import CoreData

public protocol LocalMappable {
    func mapEntityToDomain() -> AnyObject
    func mapEntityFromDomain(data: AnyObject)
}

public extension LocalMappable {
    
    func mapEntityToDomain() -> AnyObject {
        NSLog("[\(self)] - Error: Entity to domain mapper not implemented")
        
        return self as AnyObject
    }
    
    func mapEntityFromDomain(data: AnyObject) {
        NSLog("[\(self)] - Error: Domain to entity mapper not implemented")
    }
    
}

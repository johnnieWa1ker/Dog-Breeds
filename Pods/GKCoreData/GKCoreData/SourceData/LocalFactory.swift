//
//  LocalFactory.swift
//
//  Created by  Кирилл on 4/12/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKExtensions
import CoreData

public enum LocalFactory {
    
    // MARK: - Public methods
    public static func request(_ entityClass: AnyClass, predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?) -> NSFetchRequest<NSManagedObject> {
        let request: NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName: String.className(entityClass))
        
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        
        return request
    }
    
    public static func sortDescriptor(key: String, ascending: Bool) -> NSSortDescriptor {
        return NSSortDescriptor(key: key, ascending: ascending)
    }
    
    // MARK: - Private methods
    
}

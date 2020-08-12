//
//  Repository.swift
//
//  Created by  Кирилл on 4/12/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import CoreData
import GKNetwork
import GKCoreData

public protocol RepositoryInterface: AnyObject { }

open class Repository: RepositoryInterface {
    
    // MARK: - Props
    private var modelName: String
    public lazy var localInterface: LocalWorkerInterface = LocalWorker(modelName: modelName)
    public lazy var remoteInterface: RemoteWorkerInterface = RemoteWorker()
    
    open var entityClass: AnyClass {
        NSLog("[\(self)] - Entity class not implemented")
        
        return NSObject.self
    }
    
    // MARK: - Initialization
    public init(modelName: String) {
        self.modelName = modelName
    }
    
    public convenience init() {
        self.init(modelName: "UNKNOWN")
    }
    
    // MARK: - RepositoryInterface
    
    // MARK: - Module functions
    open func select(_ request: NSFetchRequest<NSManagedObject>, completion: ((_ result: [AnyObject]?, _ error: Error?) -> Void)? = nil) {
        self.localInterface.fetch(request) { (result, error) in
            if let result = result as? [LocalMappable], error == nil {
                let mappedResult = result.map({ $0.mapEntityToDomain() })
                
                guard let completion = completion else { return }
                completion(mappedResult, nil)
            } else {
                guard let completion = completion else { return }
                completion(nil, error)
            }
        }
    }
    
    open func update(_ item: AnyObject, completion: ((_ result: AnyObject?, _ error: Error?) -> Void)? = nil) {
        self.update([item]) { (result, error) in
            if let savedItem = result.first, error == nil {
                guard let completion = completion else { return }
                completion(savedItem, nil)
            } else {
                guard let completion = completion else { return }
                completion(nil, error)
            }
        }
    }
    
    open func update(_ items: [AnyObject], completion: ((_ result: [AnyObject], _ error: Error?) -> Void)? = nil) {
        var savedItems: [AnyObject] = []
        
        for item in items {
            guard let newObject = self.localInterface.create(entityName: String.className(self.entityClass)) as? LocalMappable else { continue }
            newObject.mapEntityFromDomain(data: item)
            savedItems.append(newObject.mapEntityToDomain())
        }
        
        self.localInterface.save { (result, error) in
            if result, error == nil {
                guard let completion = completion else { return }
                completion(savedItems, nil)
            } else {
                guard let completion = completion else { return }
                completion([], nil)
            }
        }
    }
    
    open func delete(_ request: NSFetchRequest<NSManagedObject>, completion: ((_ result: Bool, _ error: Error?) -> Void)? = nil) {
        self.localInterface.fetch(request) { (result, error) in
            if let result = result, error == nil {
                self.localInterface.remove(result, completion: { (result, error) in
                    guard let completion = completion else { return }
                    completion(result, error)
                })
            } else {
                guard let completion = completion else { return }
                completion(false, error)
            }
        }
    }
    
    open func execute<T: Codable>(_ request: URLRequest, response: T.Type, completion: ((_ result: Any?, _ response: HTTPURLResponse?, _ error: Error?) -> Void)? = nil) {
        self.remoteInterface.execute(request, model: response) { (result, response, error) in
            if let arrayResult = result as? [RemoteMappable] {
                let mappedResult = arrayResult.map({ $0.mapResponseToDomain() })
                
                guard let completion = completion else { return }
                completion(mappedResult, response, error)
            } else if let singleResult = result as? RemoteMappable {
                let mappedResult = singleResult.mapResponseToDomain()
                
                guard let completion = completion else { return }
                completion(mappedResult, response, error)
            } else {
                guard let completion = completion else { return }
                completion(nil, response, error)
            }
        }
    }
    
}

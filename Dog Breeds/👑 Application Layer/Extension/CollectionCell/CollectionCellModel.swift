//
//  CollectionCellModel.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 17.07.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKExtensions

public protocol CollectionCellIdentifiable {
    var cellIdentifier: String { get }
    var cellSize: CGSize { get }
    
    var userInfo: [String: Any] { get set }
}

open class CollectionCellModel: CollectionCellIdentifiable {
    
    // MARK: - Props
    open var cellIdentifier: String {
        return ""
    }
    
    public var cellSize: CGSize {
        return CGSize.zero
    }
    
    open var userInfo: [String: Any] = [:]
    
    // MARK: - Initialization
    public init() { }
}

//
//  CollectionSectionModel.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 17.07.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

public protocol CollectionSectionRepresentable {
    var rows: [CollectionCellIdentifiable] { get set }
}

open class CollectionSectionModel: CollectionSectionRepresentable {
    
    // MARK: - Props
    open var rows: [CollectionCellIdentifiable]
    
    // MARK: - Initialization
    public init() {
        self.rows = []
    }    
}

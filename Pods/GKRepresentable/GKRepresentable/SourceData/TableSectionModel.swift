//
//  TableSectionModel.swift
//
//  Created by  Кирилл on 4/12/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKExtensions

public protocol TableSectionRepresentable {
    var rows: [TableCellIdentifiable] { get set }
}

open class TableSectionModel: TableSectionRepresentable {
    
    // MARK: - Props
    open var rows: [TableCellIdentifiable]
    
    // MARK: - Initialization
    public init() {
        self.rows = []
    }
    
}

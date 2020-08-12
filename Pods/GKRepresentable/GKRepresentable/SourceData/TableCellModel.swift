//
//  TableCellModel.swift
//
//  Created by  Кирилл on 4/12/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKExtensions

public protocol TableCellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: CGFloat { get }
    
    var userInfo: [String: Any] { get set }
}

open class TableCellModel: TableCellIdentifiable {
    
    // MARK: - Props
    open var cellIdentifier: String {
        return ""
    }
    
    open var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }
    
    open var userInfo: [String: Any] = [:]
    
    // MARK: - Initialization
    public init() { }
    
}

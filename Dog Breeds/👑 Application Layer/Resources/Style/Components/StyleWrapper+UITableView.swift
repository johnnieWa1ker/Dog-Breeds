//
//  StyleWrapper+UITableView.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

extension StyleWrapper where Element: UITableView {
    
    /// Standard style for tables
    static func standart() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { table in
            table.separatorStyle = .none
            table.backgroundColor = AppTheme.mainBackground
            table.contentInset = UIEdgeInsets(top: 6.0, left: 0.0, bottom: 6.0, right: 0.0)
        }
        return wrap
    }
}

//
//  StyleWrapper+UICollectionView.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 14.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

extension StyleWrapper where Element: UICollectionView {
    
    /// Standard style for collection
    static func standart() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { collection in
            collection.backgroundColor = AppTheme.mainBackground
        }
        return wrap
    }
}

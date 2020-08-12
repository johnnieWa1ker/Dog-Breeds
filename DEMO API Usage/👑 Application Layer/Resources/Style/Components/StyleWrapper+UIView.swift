//
//  StyleWrapper+UIView.swift
//  DEMO API Usage
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

extension StyleWrapper where Element: UIView {
    
    /// Style for invisible view
    static func clear() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { view in
            view.backgroundColor = .clear
        }
        return wrap
    }
    
    /// Standard view style for background
    static func asBackground() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { view in
            view.backgroundColor = AppTheme.black
        }
        return wrap
    }
    
    /// Style for a view that will contain text or graphic content
    static func forContent() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { view in
            view.backgroundColor = AppTheme.white
        }
        return wrap
    }
    
    /// View with rounded top corners
    static func roundedTopCorners(_ color: UIColor) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { view in
            view.backgroundColor = color
            view.roundCorners([.topLeft, .topRight], radius: 20.0)
        }
        return wrap
    }
    
    /// View with all rounded corners
    static func roundedAllCorners(_ color: UIColor) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { view in
            view.backgroundColor = color
            view.roundCorners([.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 10.0)
        }
        return wrap
    }
}

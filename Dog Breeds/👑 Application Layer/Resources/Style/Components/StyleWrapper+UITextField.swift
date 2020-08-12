//
//  StyleWrapper+UITextField.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

extension StyleWrapper where Element: UITextField {
    
    /// Standard style for text fields
    static func standart() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { textField in
            
            textField.backgroundColor = AppTheme.lightGray
            textField.layer.borderWidth = 0
            textField.layer.borderColor = AppTheme.lightGray.cgColor
            textField.layer.cornerRadius = 10
            textField.layer.masksToBounds = true
            textField.borderStyle = .none
            textField.font = SFPRO.regular.font(size: 16)
            textField.textColor = AppTheme.black
            textField.placeholderColor(color: AppTheme.darkGray)
            textField.setLeftPaddingPoints(16.0)
        }
        return wrap
    }
    
    /// Text field status when an error occurred
    static func error() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { textField in
            
            textField.backgroundColor = AppTheme.secondBackground.withAlphaComponent(0.07)
            textField.layer.borderWidth = 2
            textField.layer.borderColor = AppTheme.mainAccent.cgColor
            textField.layer.cornerRadius = 10
            textField.layer.masksToBounds = true
            textField.borderStyle = .none
            textField.font = SFPRO.regular.font(size: 16)
            textField.textColor = AppTheme.black
            textField.placeholderColor(color: AppTheme.darkGray)
            textField.setLeftPaddingPoints(16.0)
        }
        return wrap
    }
}

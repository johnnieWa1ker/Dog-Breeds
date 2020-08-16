//
//  StyleWrapper+UIButton.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation
import UIKit

extension StyleWrapper where Element: UIButton {
    
    /// Button with rounded corners. The background matches the main color theme of the application.
    static func accent() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { button in
            button.backgroundColor = AppTheme.mainAccent
            button.setTitleColor(AppTheme.white, for: .normal)
            button.titleLabel?.font = SFPRO.medium.font(size: 18.0)
            button.layer.cornerRadius = 10.0
            button.layer.masksToBounds = true
        }
        return wrap
    }
    
    /// Button with transparent background. The main accent color in the signature.
    static func accentNegative() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { button in
            button.backgroundColor = .clear
            button.setTitleColor(AppTheme.mainAccent, for: .normal)
            button.titleLabel?.font = SFPRO.medium.font(size: 18.0)
            button.layer.cornerRadius = 10.0
            button.layer.masksToBounds = true
        }
        return wrap
    }
    
    /// Button with main accent background, with heart icon
    static func likeButton() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { button in
            button.backgroundColor = AppTheme.mainAccent
            button.tintColor = AppTheme.white
            button.setTitle("", for: .normal)
            button.setImage(UIImage(systemName: "heart"), for: .normal)
            button.setImage(UIImage(systemName: "heart.fill"), for: .highlighted)
            button.layer.cornerRadius = button.frame.width / 2
            button.layer.masksToBounds = true
        }
        return wrap
    }
    
    /// Button with main accent background, with arrow icon
    static func shareButton() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { button in
            button.backgroundColor = AppTheme.secondAccent
            button.tintColor = AppTheme.white
            button.setTitle("", for: .normal)
            button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
            button.setImage(UIImage(systemName: "square.and.arrow.up.fill"), for: .highlighted)
            button.layer.cornerRadius = button.frame.width / 2
            button.layer.masksToBounds = true
        }
        return wrap
    }
}

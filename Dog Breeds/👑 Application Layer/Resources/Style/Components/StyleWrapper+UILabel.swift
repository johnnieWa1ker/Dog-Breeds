//
//  StyleWrapper+UILabel.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

import UIKit

extension StyleWrapper where Element: UILabel {
    
    // MARK: - SFPRO Display
    
    // MARK: Title 2
    
    /// SFPRO 24 | Regular
    static func sfTitle2Regular24(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = SFPRO.regular.font(size: 24)
            label.textColor = color
        }
        return wrap
    }
    
    /// SFPRO 24 | Bold
    static func sfTitle2Bold24(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = SFPRO.bold.font(size: 24)
            label.textColor = color
        }
        return wrap
    }
    
    // MARK: Title 3
    
    /// SFPRO 20 | Semibold
    static func sfTitle3Semibold20(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = SFPRO.semibold.font(size: 20)
            label.textColor = color
        }
        return wrap
    }
    
    /// SFPRO 20 | Regular
    static func sfTitle3Regular20(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = SFPRO.regular.font(size: 20)
            label.textColor = color
        }
        return wrap
    }
    
    // MARK: - Headline
    
    /// SFPRO 18 | Semibold
    static func sfHeadlineBold18(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = SFPRO.bold.font(size: 18)
            label.textColor = color
        }
        return wrap
    }
    
    /// SFPRO 18 | Semibold
    static func sfHeadlineSemibold18(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = SFPRO.semibold.font(size: 18)
            label.textColor = color
        }
        return wrap
    }
    
    /// SFPRO 16 | Regular
    static func sfHeadlineRegular16(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = SFPRO.regular.font(size: 16)
            label.textColor = color
        }
        return wrap
    }
    
    // MARK: Body
    
    /// SFPRO 14 | Regular
    static func sfBodyRegular14(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = SFPRO.regular.font(size: 14)
            label.textColor = color
        }
        return wrap
    }
    
    /// SFPRO 14 | Semibold
    static func sfBodySemibold14(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = SFPRO.semibold.font(size: 14)
            label.textColor = color
        }
        return wrap
    }
    
    // MARK: Subheadline
    
    /// SFPRO 18 | Regular
    static func sfSubheadlineRegular18(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = SFPRO.regular.font(size: 18)
            label.textColor = color
        }
        return wrap
    }
    
    /// SFPRO 16 | Semibold
    static func sfSubheadlineSemibold16(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = SFPRO.semibold.font(size: 16)
            label.textColor = color
        }
        return wrap
    }
    
    // MARK: Caption
    
    /// SFPRO 11 | Regular
//    static func sfCaptionRegular11(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
//        let wrap = StyleWrapper.wrap { label in
//            label.textAlignment = textAlignment ?? .left
//            label.numberOfLines = 0
//            label.lineBreakMode = .byTruncatingMiddle
//            label.font = SFPRO.regular.font(size: 11)
//            label.textColor = color
//        }
//        return wrap
//    }
    
    /// SFPRO 11 | Medium
//    static func sfCaptionMedium11(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
//        let wrap = StyleWrapper.wrap { label in
//            label.textAlignment = textAlignment ?? .left
//            label.numberOfLines = 0
//            label.lineBreakMode = .byTruncatingMiddle
//            label.font = SFPRO.medium.font(size: 11)
//            label.textColor = AppTheme.flameLightGray
//            label.textColor = color
//        }
//        return wrap
//    }
    
    /// SFPRO 12 | Semibold
//    static func sfCaptionSemibold12(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
//        let wrap = StyleWrapper.wrap { label in
//            label.textAlignment = textAlignment ?? .left
//            label.numberOfLines = 0
//            label.lineBreakMode = .byTruncatingMiddle
//            label.font = SFPRO.semibold.font(size: 12)
//            label.textColor = color
//        }
//        return wrap
//    }
}

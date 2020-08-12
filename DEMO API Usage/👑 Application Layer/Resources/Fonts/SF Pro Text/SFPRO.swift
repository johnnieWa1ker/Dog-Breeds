//
//  SFPRO.swift
//  Flame
//
//  Created by Johnnie Walker on 18.03.2020.
//  Copyright © 2020 AppCraft. All rights reserved.
//

import UIKit

enum SFPRO {
    case light
    case regular
    case medium
    case semibold
    case bold
    
    public func font(size: CGFloat) -> UIFont {
        switch self {
        case .light:
            if let font = UIFont(name: "SF-Pro-Display-Light", size: size) {
                return font
            }
            return UIFont.systemFont(ofSize: size, weight: .light)
        case .regular:
            if let font = UIFont(name: "SF-Pro-Text-Regular", size: size) {
                return font
            }
            return UIFont.systemFont(ofSize: size, weight: .regular)
        case .medium:
            if let font = UIFont(name: "SF-Pro-Text-Medium", size: size) {
                return font
            }
            return UIFont.systemFont(ofSize: size, weight: .medium)
        case .semibold:
            if let font = UIFont(name: "SF-Pro-Text-Semibold", size: size) {
                return font
            }
            return UIFont.systemFont(ofSize: size, weight: .semibold)
        case .bold:
            if let font = UIFont(name: "SF-Pro-Text-Bold", size: size) {
                return font
            }
            return UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }
}

//
//  UICollectionViewCell+Identifier.swift
//  GKExtensions
//
//  Created by  Кирилл on 4/12/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import UIKit

public extension UICollectionViewCell {
    
    class var identifier: String {
        return String.className(self)
    }
    
}

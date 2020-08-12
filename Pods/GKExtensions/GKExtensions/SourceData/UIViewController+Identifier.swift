//
//  UIViewController+Identifier.swift
//  Trade Union
//
//  Created by  Кирилл on 1/15/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    class var identifier: String {
        return String.className(self)
    }
    
}

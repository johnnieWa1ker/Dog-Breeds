//
//  Loader.swift
//  DEMO API Usage
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation
import SVProgressHUD
import GKViper

class Loader {
    
    private let outerRadius: CGFloat = 30
    private let outerColor: UIColor = AppTheme.gray
    
    private let outerRadiusError: CGFloat = 10
    private let outerColorError: UIColor = .red
    
    private let ringRadius: CGFloat = 12
    private let ringThickness: CGFloat = 3
    private let ringColor: UIColor = AppTheme.orange
    
    init() {
        DispatchQueue.main.async {
            SVProgressHUD.setDefaultStyle(.custom)
            SVProgressHUD.setDefaultMaskType(.clear)
            SVProgressHUD.setRingRadius(self.ringRadius)
            SVProgressHUD.setRingThickness(self.ringThickness)
            SVProgressHUD.setRingNoTextRadius(self.ringRadius)
            SVProgressHUD.setMinimumSize(CGSize(width: self.outerRadius * 2, height: self.outerRadius * 2))
            SVProgressHUD.setCornerRadius(self.outerRadius)
            SVProgressHUD.setForegroundColor(self.ringColor)
            SVProgressHUD.setBackgroundColor(self.outerColor)
        }
    }
    
    func show() {
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }
    
    func hide() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
}

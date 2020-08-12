//
//  UIImageView.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(fromUrl url: URL?, placeholder: UIImage?, completionHandler: ((_ result: Bool) -> Void)? = nil) {
        self.kf.indicatorType = .activity
        guard let url = url else {
            self.kf.indicatorType = .none
            self.image = placeholder
            return
        }
        self.kf.setImage(
            with: url,
            placeholder: nil,
            options: [.diskCacheExpiration(.seconds(600)), .transition(.none)],
            progressBlock: nil
        ) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let value):
                self.image = value.image
                if let completion = completionHandler {
                    completion(true)
                }
            case .failure:
                self.image = placeholder
                if let completion = completionHandler {
                    completion(false)
                }
            }
        }
    }
}

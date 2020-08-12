//
//  String.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

extension String {
    
    // Returns a random Emoji 🌿
    static func randomEmoji() -> String {
        let range = [UInt32](0x1F601...0x1F64F)
        let ascii = range[Int(Double.random(in: 0.0...1.0) * (Double(range.count)))]
        let emoji = UnicodeScalar(ascii)?.description
        return emoji ?? "❓"
    }
}

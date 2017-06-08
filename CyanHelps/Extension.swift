//
//  Extension.swift
//  CyanHelps
//
//  Created by CenoX on 2017/06/08.
//  Copyright © 2017 CenoX. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class var namco: UIColor { return UIColor(hex: "#F55A2A") }
    class var game: UIColor { return UIColor(hex: "#9b55e2") }
    class var jpop: UIColor { return UIColor(hex: "#70cc3b") }
    class var classic: UIColor { return UIColor(hex: "#d2b46d") }
    class var variety: UIColor { return UIColor(hex: "#91df57") }
    class var vocaloid: UIColor { return UIColor(hex: "#6a6a6a") }
    class var anime: UIColor { return UIColor(hex: "#f9ca25") }
    
    convenience init(hex value: String) {
        let hex = value.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

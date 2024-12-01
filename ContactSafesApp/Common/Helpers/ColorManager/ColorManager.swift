//
//  ColorManager.swift
//  TravelAssistant
//
//  Created by Metehan Veliashvili on 16.10.2024.
//

import UIKit


class ColorManager {
    public static let shared = ColorManager()
    private init() {}
}

extension ColorManager: ConvertHexCodeToColorProtocol {
    func convertColor(from hex: String) -> UIColor {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        let alpha = CGFloat(1.0)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
}

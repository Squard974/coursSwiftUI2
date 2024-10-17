//
//  ColorExtensions.swift
//  coursSwiftUI
//
//  Created by WERR Sébastien on 17/10/2024.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let r, g, b: Double
        
        var hexColor = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexColor = hexColor.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexColor).scanHexInt64(&rgb)
        
        if hexColor.count == 6 {
            r = Double((rgb >> 16) & 0xFF) / 255
            g = Double((rgb >> 8) & 0xFF) / 255
            b = Double(rgb & 0xFF) / 255
        } else {
            r = 0
            g = 0
            b = 0
        }
        
        self.init(red: r, green: g, blue: b)
    }
}


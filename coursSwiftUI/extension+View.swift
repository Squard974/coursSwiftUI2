//
//  extension+View.swift
//  coursSwiftUI
//
//  Created by WERR Sébastien on 16/10/2024.
//

import SwiftUI

extension View {
    
    func goldenFrame() -> some View {
        self
            .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous).stroke(Color.black, lineWidth: 1))
            .background(.white)

    }
    
    func blueBackground(height: CGFloat) -> some View {
        self
            .frame(height: height)
            .background(.blue)
    }
    
    
}

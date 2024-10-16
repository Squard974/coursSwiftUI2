//
//  extension+View.swift
//  coursSwiftUI
//
//  Created by WERR Sébastien on 16/10/2024.
//

import SwiftUI

struct IconView: View {
    
    let image: Image
    let name: String
    
    var body: some View {
        VStack {
            Text(name)
            image
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
        }
        .frame(width: 220, height: 260)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
        .background(LinearGradient(colors: [.gray, .cyan], startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .font(.system(size: 22, weight: .bold))
        
    }
}

#Preview {
    IconView(image: Image("Mystery"), name: "Jeu")
}

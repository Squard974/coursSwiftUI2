//
//  MenuAppsView.swift
//  coursSwiftUI
//
//  Created by WERR Sébastien on 16/10/2024.
//

import SwiftUI

struct MenuAppsView: View {
    var body: some View {
        NavigationView {
            VStack{
                ScrollView{
                    Text("Menu des applications")
                        .padding()
                        .foregroundStyle(.white)
                        //.goldenFrame()
                        .font(.system(size: 25, weight: .bold))
                        .padding()
                        .padding(.top, 55)
                    
                    ForEach(availableApps.allCases, id: \.self) { nameApp in
                        IconView(image: nameApp.image, name: nameApp.title)
                        NavigationLink(destination: nameApp.view) {
                            Text("Jouer à \"\(nameApp.title)\"")
                                .padding()
                                .background(.blue)
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.bottom, 30)
                        }
                    }
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .background(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.85), .gray,]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
        }
    }
}
    
#Preview {
    MenuAppsView()
}

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
                        .goldenFrame()
                        .font(.system(size: 25, weight: .bold))
                    
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
                        }
                    }
                    
                    
                    //                NavigationLink(destination: ContentView()) {
                    //                    Text("Menu")
                    //                        .padding()
                    //                        .background(.blue)
                    //                        .foregroundStyle(.white)
                    //
                    //                }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            
        }
    }
}
    
#Preview {
    MenuAppsView()
}

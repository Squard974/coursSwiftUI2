//
//  MysteryNumberView.swift
//  coursSwiftUI
//
//  Created by WERR Sébastien on 16/10/2024.
//

import SwiftUI

struct JackpotView: View {
    @StateObject var viewModel = MainViewModel()
    
    @State var login: String = ""
    @State var password: String = ""
    @State var alert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack() {
                
                Image("Jackpot")
                    .resizable() //autorise la modification de la taille de l'image
                    .frame(width: 200, height: 200)
                
                if !viewModel.isValid {
                    VStack {
                        Text("Obtenez trois chiffres identiques !")
                            .padding()
                            .font(.system(size: 20, weight: .bold))
                        HStack{
                            TextField("?", text: $login)
                                .frame(width: 50, height: 60)
                                .background(.white)
                                .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous).stroke(Color.black, lineWidth: 1))
                                .multilineTextAlignment(.center)
                            
                            TextField("?", text: $password)
                                .frame(width: 50, height: 60)
                                .background(.white)
                                .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous).stroke(Color.black, lineWidth: 1))
                                .multilineTextAlignment(.center)
                            
                            TextField("?", text: $password)
                                .frame(width: 50, height: 60)
                                .background(.white)
                                .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous).stroke(Color.black, lineWidth: 1))
                                .multilineTextAlignment(.center)
                        }

                        
                        Button {
                            guard login != "" else{
                                alert = true
                                return
                            }
                            viewModel.checkConnection(login: login, password: password)
                        } label: {
                            Text("Se connecter")
                        }
                        .background(.blue)
                        .tint(.white)
                        .padding()
                        
                    }
                } else {
                    NavigationLink(destination: MenuAppsView()) {
                        Text("Menu")
                            .padding()
                            .background(.blue)
                            .foregroundStyle(.white)
                            
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .alert(isPresented: $alert){
                Alert(title: Text("Alerte !"), message: Text("Vous devez entrer un login !!"))
            }
        }
    }
}

#Preview {
    JackpotView()
}

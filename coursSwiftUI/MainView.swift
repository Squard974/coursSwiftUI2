//
//  MainView.swift
//  coursSwiftUI
//
//  Created by WERR Sébastien on 16/10/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    @State var login: String = ""
    @State var password: String = ""
    @State var alert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack() {
                
//                Image("Classe")
//                    .resizable() //autorise la modification de la taille de l'image
//                    .frame(width: 200, height: 200)
                
                if !viewModel.isValid {
                    VStack {
                        Text("Connectez-vous à l'application")
                            .padding()
                            .font(.system(size: 35, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.bottom, 50)
                        
                        TextField("Identifiant", text: $login)
                            .padding()
                            .frame(width: 246, height: 44)
                            .background(.white)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.bottom, 20)
                        
                        TextField("Mot de passe", text: $password)
                            .padding()
                            .frame(width: 246, height: 44)
                            .background(.white)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Button {
                            guard login != "" else{
                                alert = true
                                return
                            }
                            viewModel.checkConnection(login: login, password: password)
                        } label: {
                            Text("Se connecter")
                        }
                        .tint(.white)
                        .padding()
                        .background(.blue)
                        .font(.system(size: 18, weight: .bold))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.top, 25)
                        
                    }
                } else {
                    NavigationLink(destination: MenuAppsView()) {
                        Text("Accéder au menu")
                            .padding()
                            .font(.system(size: 35, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(15)
                            
                    }
                }
            }

            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.85), .gray,]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
            .alert(isPresented: $alert){
                Alert(title: Text("Alerte !"), message: Text("Vous devez entrer un login !!"))
                
            }
        }
    }
}

#Preview {
    MainView()
}

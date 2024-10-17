//
//  MysteryNumberView.swift
//  coursSwiftUI
//
//  Created by WERR Sébastien on 16/10/2024.
//

import SwiftUI

struct MysteryNumberView: View {
    @StateObject var viewModel = MainViewModel()
    
    @State var guess: String = ""
    @State var alert: Bool = false
    @State var numberToFind: Int = 0
    
    @State var cptEssais: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack() {
                
                Image("Mystère")
                    .resizable() //autorise la modification de la taille de l'image
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1)
                    }
                
 
                VStack {
                    Text("Trouvez le nombre mystère ! (1-100)")
                        .padding()
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                    
                    Text("Nombre d'essais : \(cptEssais)")
                        .padding()
                        .font(.system(size: 15))
                    
                    TextField("Nombre", text: $guess)
                        .frame(width: 110, height: 50)
                        .background(.white)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    

                    Button {
                        guard let guessInt = Int(guess), !guess.isEmpty else {
                            alert = true
                            return
                        }
                        guard guessInt >= 1 && guessInt <= 100 else {
                            alert = true
                            return
                        }
                        
                        viewModel.checkGuess(guess: guessInt, expectedNumber: numberToFind)
                        cptEssais += 1
                    } label: {
                        Text("Confirmer")
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
                    
                    if !viewModel.feedbackMessage.isEmpty {
                        Text(viewModel.feedbackMessage)
                            .padding()
                            .font(.system(size: 18))
                            .foregroundColor(.blue)
                            .frame(height: 80)
                    } else {
                        Text(" ")
                            .padding()
                            .frame(height: 80)
                    }
                    
                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .alert(isPresented: $alert){
                Alert(title: Text("Alerte !"), message: Text("Votre entrée est incorrecte, veuillez entrer un nombre entre 1 et 100 !"))
            }
            .onAppear {
                numberToFind = Int.random(in: 1...100)
            }
        }
    }
}

#Preview {
    MysteryNumberView()
}

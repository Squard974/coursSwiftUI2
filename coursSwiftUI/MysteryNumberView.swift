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
    @State var numberToFind: Int = Int.random(in: 1...100)
    
    var body: some View {
        NavigationStack {
            VStack() {
                
                Image("Mystère")
                    .resizable() //autorise la modification de la taille de l'image
                    .frame(width: 200, height: 200)
                
 
                VStack {
                    Text("Trouvez le nombre mystère ! (1-100)")
                        .padding()
                        .font(.system(size: 20, weight: .bold))
                    
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
                    
                    if alert == true {
                        Text("Entrée incorrecte !")
                            .padding()
                            .font(.system(size: 18))
                            .foregroundColor(.red)
                            .frame(height: 80)
                    } else if !viewModel.feedbackMessage.isEmpty {
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
                // Générer un nouveau nombre à chaque fois que la vue apparaît
                numberToFind = Int.random(in: 1...100)
            }
        }
    }
}

#Preview {
    MysteryNumberView()
}

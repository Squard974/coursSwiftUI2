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
                        viewModel.checkGuess(guess: guessInt, expectedNumber: numberToFind)
                    } label: {
                        Text("Confirmer")
                    }
                    .background(.blue)
                    .tint(.white)
                    .padding()
                    
                    Text(viewModel.feedbackMessage)
                        .padding()
                        .font(.system(size: 18))
                        .foregroundColor(.green) // Change la couleur selon ton design
                
                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .alert(isPresented: $alert){
                Alert(title: Text("Alerte !"), message: Text("Votre entrée est incorrecte, veuillez entrez un nombre !"))
            }
        }
    }
}

#Preview {
    MysteryNumberView()
}

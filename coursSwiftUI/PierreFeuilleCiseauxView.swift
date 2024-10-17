//
//  PierreFeuilleCiseauxView.swift
//  coursSwiftUI
//
//  Created by WERR Sébastien on 17/10/2024.
//

import SwiftUI

struct PierreFeuilleCiseauxView: View {
    @StateObject var viewModel = MainViewModel()
    
    @State var guess: String = ""
    @State var alert: Bool = false
    @State var numberToFind: Int = 0
    
    @State var moveAdversaire: String = ""
    
    @State var moveJoueur: String = ""
    
    @State var cptWin: Int = 0
    @State var cptAdversaire: Int = 0
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    
    var body: some View {
        NavigationStack {
            VStack() {
                
                Image("Rcp")
                    .resizable() //autorise la modification de la taille de l'image
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
                
 
                VStack {
                    Text("Gagnez 3 manches pour remporter la partie !!")
                        .padding()
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                    
                    Text("Manches gagnées : \(cptWin)")
                        .padding()
                        .font(.system(size: 20))
                    HStack{
                        Text("Adversaire (\(cptAdversaire)):")
                            .padding()
                            .font(.system(size: 20))
                            .padding(.bottom, 30)
                        
                        Text(viewModel.emojiForMove(move: moveAdversaire))
                            .frame(width: 40, height: 70)
                            .padding()
                            .font(.system(size: 40))
                            .overlay {
                                RoundedRectangle(cornerRadius: 30).stroke(Color.black, lineWidth: 1)
                            
                            }
                    }

                    
                    
                    HStack{
                        Button{
                            moveAdversaire = viewModel.generateRandomMove()
                            if let result = viewModel.playRound(moveJoueur: "P", moveAdversaire: moveAdversaire) {
                                    if result {
                                        cptWin += 1
                                        if cptWin == 3 {
                                            alertMessage = "Vous avez gagné la partie !"
                                            showAlert = true
                                            cptWin = 0
                                            cptAdversaire = 0
                                        }
                                    } else {
                                        cptAdversaire += 1
                                        if cptAdversaire == 3 {
                                            alertMessage = "L'adversaire a gagné la partie !"
                                            showAlert = true
                                            cptWin = 0
                                            cptAdversaire = 0
                                        }
                                    }
                                } else {
                                    print("égalité")
                                }
                        } label: {
                            Text("🪨")
                        }
                        .font(.system(size: 40))
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 30).stroke(Color.black, lineWidth: 1)
                        }
                        Button{
                            moveAdversaire = viewModel.generateRandomMove()
                            if let result = viewModel.playRound(moveJoueur: "F", moveAdversaire: moveAdversaire) {
                                    if result {
                                        cptWin += 1
                                        if cptWin == 3 {
                                            alertMessage = "Vous avez gagné la partie !"
                                            showAlert = true
                                            cptWin = 0
                                            cptAdversaire = 0
                                        }
                                    } else {
                                        cptAdversaire += 1
                                        if cptAdversaire == 3 {
                                            alertMessage = "L'adversaire a gagné la partie !"
                                            showAlert = true
                                            cptWin = 0
                                            cptAdversaire = 0
                                        }
                                    }
                                } else {
                                    print("égalité")
                                }
                        } label: {
                            Text("📜")
                        }
                        .font(.system(size: 40))
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 30).stroke(Color.black, lineWidth: 1)
                        }
                        Button{
                            moveAdversaire = viewModel.generateRandomMove()
                            if let result = viewModel.playRound(moveJoueur: "C", moveAdversaire: moveAdversaire) {
                                    if result {
                                        cptWin += 1
                                        if cptWin == 3 {
                                            alertMessage = "Vous avez gagné la partie !"
                                            showAlert = true
                                            cptWin = 0
                                            cptAdversaire = 0
                                        }
                                    } else {
                                        cptAdversaire += 1
                                        if cptAdversaire == 3 {
                                            alertMessage = "L'adversaire a gagné la partie !"
                                            showAlert = true
                                            cptWin = 0
                                            cptAdversaire = 0
                                        }
                                    }
                                } else {
                                    print("égalité")
                                }
                        } label: {
                            Text("✂️")
                        }
                        .font(.system(size: 40))
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 30).stroke(Color.black, lineWidth: 1)
                        }
                    }
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
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Fin de la partie"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    PierreFeuilleCiseauxView()
}


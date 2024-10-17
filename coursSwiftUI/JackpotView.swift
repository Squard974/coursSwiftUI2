//
//  MysteryNumberView.swift
//  coursSwiftUI
//
//  Created by WERR Sébastien on 16/10/2024.
//

import SwiftUI

struct JackpotView: View {
    @StateObject var viewModel = MainViewModel()
    
    @State var alert: Bool = false
    
    @State var triche: Bool = false
    
    @State var victoire: Bool = false
    
    @State var number1: String = "?"
    @State var number2: String = "?"
    @State var number3: String = "?"

    var body: some View {
        NavigationStack {
            VStack() {
                
                Image("Jackpot")
                    .resizable() //autorise la modification de la taille de l'image
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
                
                if !viewModel.isValid {
                    VStack {
                        Text("Obtenez trois 7 pour gagner !")
                            .padding()
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.center)
                        HStack{
                            Text("\(number1)")
                                .frame(width: 60, height: 70)
                                .background(.white)
                                .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous).stroke(Color.black, lineWidth: 1))
                                .multilineTextAlignment(.center)
                                .font(.system(size: 60, weight: .heavy))
                                .foregroundColor(.red)
                            
                            Text("\(number2)")
                                .frame(width: 60, height: 70)
                                .background(.white)
                                .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous).stroke(Color.black, lineWidth: 1))
                                .multilineTextAlignment(.center)
                                .font(.system(size: 60, weight: .heavy))
                                .foregroundColor(.red)
                            
                            Text("\(number3)")
                                .frame(width: 60, height: 70)
                                .background(.white)
                                .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous).stroke(Color.black, lineWidth: 1))
                                .multilineTextAlignment(.center)
                                .font(.system(size: 60, weight: .heavy))
                                .foregroundColor(.red)
                        }

                        
                        Button {
                            triche = false
                            let results = viewModel.jackpot(enableCheat: triche)

                            if results.count == 3 {
                                number1 = String(results[0])
                                number2 = String(results[1])
                                number3 = String(results[2])
                                
                                if number1 == "7" && number2 == "7" && number3 == "7" {
                                    victoire = true
                                }
                            }
                        } label: {
                            Text("Essai")
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
                        
                        Button {
                            triche = true
                            let results = viewModel.jackpot(enableCheat: triche)

                            if results.count == 3 {
                                number1 = String(results[0])
                                number2 = String(results[1])
                                number3 = String(results[2])
                                
                                if number1 == "7" && number2 == "7" && number3 == "7" {
                                    victoire = true
                                }
                            }
                        } label: {
                            Text("Essai truqué")
                        }
                        .tint(.white)
                        .padding()
                        .background(.red)
                        .font(.system(size: 18, weight: .bold))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.top, 25)
                        
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
            .alert(isPresented: $victoire) {
                Alert(title: Text("Félicitations ! "), message: Text("Vous avez gagné !💰💰"), dismissButton: .default(Text("OK")))
            
            }
        }
    }
}

#Preview {
    JackpotView()
}

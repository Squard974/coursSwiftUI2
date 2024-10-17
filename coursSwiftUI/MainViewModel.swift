//
//  MainViewModel.swift
//  coursSwiftUI
//
//  Created by WERR Sébastien on 16/10/2024.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var isValid = false
    @Published var feedbackMessage: String = "" 


    func checkConnection(login: String, password: String) {
        //let passwordTest = DataController.registeredUsers[login]
        if let realPassword = DataController.registeredUsers[login] { // L'index existe-t-il ?
            if realPassword == password { // Le mot de passe est-il bon ?
                isValid = true
            } else {
                isValid = false
                // TODO: Messages d'erreur
            }
        } else {
            isValid = false
            // TODO: Messages d'erreurs
        }
    }
    
    func checkGuess(guess: Int, expectedNumber: Int){
        if guess < expectedNumber {
            feedbackMessage = "Trop bas ! Essayez encore."
        } else if guess > expectedNumber {
            feedbackMessage = "Trop haut ! Essayez encore."
        } else {
            feedbackMessage = "Félicitations !! Vous avez trouvé 🎉 🙌"
        }
    }
    
    func additionne(_ a:Int, et b: Int) -> Int {
        return a + b
    }
    

}

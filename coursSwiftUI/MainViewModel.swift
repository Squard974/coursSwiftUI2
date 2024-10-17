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
    
    func jackpot(enableCheat: Bool) -> [Int]{
        if enableCheat{
            return [7, 7, 7]
        } else {
            return [Int.random(in: 1...9), Int.random(in: 1...9), Int.random(in: 1...9)]
        }
        
    }
    
    func playRound(moveJoueur: String, moveAdversaire: String) -> Bool? {
        
        if moveJoueur == moveAdversaire {
            return nil
        }
        
        switch moveJoueur {
        case "P":
            return moveAdversaire == "C"
        case "F":
            return moveAdversaire == "P"
        case "C":
            return moveAdversaire == "F"
        default:
            return false
        }
    }

    func generateRandomMove() -> String {
        let moves = ["P", "F", "C"]
        return moves.randomElement()!
    }
    
    func emojiForMove(move: String) -> String {
        switch move {
        case "P":
            return "🪨"
        case "F":
            return "📜"
        case "C":
            return "✂️"
        default:
            return ""
        }
    }
    
    
    func additionne(_ a:Int, et b: Int) -> Int {
        return a + b
    }
    

}

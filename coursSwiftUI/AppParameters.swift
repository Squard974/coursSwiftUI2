//
//  AppParameters.swift
//  coursSwiftUI
//
//  Created by WERR Sébastien on 16/10/2024.
//

import SwiftUI

class AppParameters{
    static let backgroundColor: Color = .orange
    static var isValid: Bool = true
    
}

enum availableApps: String{
    static let allCases: [availableApps] = [.mystery, .jackpot, .autre]
    
    case mystery
    case jackpot
    case autre
    
    var image: Image{
        switch self{
        case .mystery:
            return Image("Mystère")
        case .jackpot:
            return Image("Jackpot")
        case .autre:
            return Image("Rien")
        }
    }
    
    var view: AnyView {
        switch self {
        case .mystery:
            return AnyView(MysteryNumberView())
        case .jackpot:
            return AnyView(JackpotView())
        case .autre:
            return AnyView(Text("Aucune vue définie"))
        }
    }
    
    var title: String{
        switch self{
            case .mystery:
                return "Nombre mystère"
            case .jackpot:
                return "Jackpot"
            case .autre:
                return "Autre"
        }
    }

}

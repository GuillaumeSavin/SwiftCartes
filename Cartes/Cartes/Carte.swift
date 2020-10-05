//
//  Carte.swift
//  Cartes
//
//  Created by Guillaume Savin on 05/10/2020.
//  Copyright © 2020 Guillaume Savin. All rights reserved.
//

import Foundation

struct Carte {
    enum Valeur : Int, CustomStringConvertible{
        case deux = 2, trois, quatre, cinq, six, sept, huit, neuf, dix, valet, dame, roi, `as`
        var description : String{
            switch self {
            case .`as`:
                return "A"
            case .deux:
                return "2"
            case .trois:
                return "3"
            case .quatre:
                return "4"
            case .cinq:
                return "5"
            case .six:
                return "6"
            case .sept:
                return "7"
            case .huit:
                return "8"
            case .neuf:
            	return "9"
            case .dix:
                return "10"
            case .valet:
                return "J"
            case .dame:
                return "Q"
            case .roi:
            	return "K"
            }
        }
    }
    
    enum Couleur : Int, CustomStringConvertible{
        case TREFLE = 0
        case CARREAU = 1
        case COEUR = 2
        case PIQUE = 3
        var description : String {
            switch self {
            case .TREFLE:
                return "♣️"
            case .CARREAU:
                return "♦️"
            case .COEUR:
                return "♥️"
            case .PIQUE:
                return "♠️"
            }
        }
    }
    let rawValue : Int
    let couleur : Couleur
    let valeur : Valeur
    
    init(val: Valeur = Valeur.`as`, coul: Couleur = Couleur.COEUR) {
        self.valeur = val
        self.couleur = coul
        
        switch val {
        case .`as`:
            self.rawValue = (coul.rawValue * 13 + 12)
        case .valet:
            self.rawValue = (coul.rawValue * 13 + 9)
        case .dame:
            self.rawValue = (coul.rawValue * 13 + 10)
        case .roi:
        	self.rawValue = (coul.rawValue * 13 + 11)
        default:
            self.rawValue = (coul.rawValue * 13 + Int(val.rawValue - 2))
        }
        print(self.rawValue)
    }
    
    init?(raw: Int) {
        print("raw: \(raw)")
        if(raw < 0 || raw > 51) {
            return nil
        }
        let newColor : Int
        let newValue : Int
        let newCard : Carte
        
        newColor = raw / 13
        newValue =  raw % 13
        newCard = Carte(val: Carte.Valeur(rawValue: newValue)!, coul: Carte.Couleur(rawValue: newColor)!)
        self.couleur = newCard.couleur
        self.valeur = newCard.valeur
        self.rawValue = newCard.rawValue
        
    }

}

extension Carte : Comparable {
    static func < (left: Carte, right: Carte) -> Bool {
        if left.rawValue > right.rawValue {
            return false
        } else {
            return true
        }
    }
}

extension Carte : Strideable {
    func advanced(by n:Int) -> Carte {
        return Carte(raw: (self.rawValue + n))!
    }
    func distance(to other: Carte) -> Int {
        return abs(self.rawValue - other.rawValue)
    }
}
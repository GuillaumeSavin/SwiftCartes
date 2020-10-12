//
//  main.swift
//  Cartes
//
//  Created by Guillaume Savin on 05/10/2020.
//  Copyright © 2020 Guillaume Savin. All rights reserved.
//

import Foundation

let a = Carte()
let b = Carte(val: .deux, coul: .TREFLE)
let c = Carte(coul: .COEUR)
let d = Carte(val: .huit)
let e = Carte(val: Carte.Valeur(rawValue: 4)!, coul: Carte.Couleur(rawValue: 2)!)
print(a)
print("val a : \(a.rawValue), val b : \(b.rawValue), test a < b : \(a < b)")
print("val a : \(a.rawValue), val c : \(c.rawValue), test a == b : \(a == c)")
print("val a : \(a.rawValue), val d : \(d.rawValue), test a < d : \(a != d)")
print("val e : \(e.rawValue), val a : \(a.rawValue), test e > a : \(e > a)")
print("val e : \(e.rawValue), val a : \(a.rawValue), test e >= a : \(e >= a)")
print("val a : \(a.rawValue), val b : \(b.rawValue), test min(a, b) : \(min(a, b))")
print("val a : \(a.rawValue), val b : \(b.rawValue), test max(a, b) : \(max(a, b))")

for carte in b ... d {
    print("\(carte)", terminator: ":")
}

let f : Carte = "8♣️"
print("f : \(f)")

for carte : Carte in "8♣️"..."4♦️"{
    print(carte)
}




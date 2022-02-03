//
//  Pokemon.swift
//  Pokedex
//
//  Created by Admin on 05/01/2022.
//

import SwiftUI

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let attack: String
    let detail: String
    let xp: String
    let hp: Int
    let defesa: String
    let Forte : String
    let Fraco : String
    let ataque1: String
    let ataque2: String
    let ataque3: String
    let ataque4 : String


}



let MOKE_POKEMON: [Pokemon] = [
    .init(id: 0, name: "Bulbasaur", imageUrl: "1" , type: "Poison",attack:"50",detail:"There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.",xp:"10",hp:30,defesa:"80",Forte: "Água - Terra - Pedra",Fraco: "Fogo - Grama - Veneno",ataque1:"ATTACK1", ataque2:"ATTACK2",ataque3:"ATTACK3",ataque4:"ATTACK4"),
    .init(id: 1, name: "Charizard", imageUrl: "3" , type: "Fier",attack:"50",detail:"ola",xp:"10",hp:30,defesa:"80", Forte: "ForBulba",Fraco: "Fogo, Grama, Veneno",ataque1:"ATTACK1", ataque2:"ATTACK2",ataque3:"ATTACK3",ataque4:"ATTACK4"),
    .init(id: 2, name: "Charmander", imageUrl: "2" , type: "Fier",attack:"50",detail:"ola",xp:"10",hp:30,defesa:"80",Forte: "ForBulba",Fraco: "Fogo, Grama, Veneno",ataque1:"ATTACK1", ataque2:"ATTACK2",ataque3:"ATTACK3",ataque4:"ATTACK4"),
    .init(id: 3, name: "Ivysaur", imageUrl: "1" , type: "Poison",attack:"50",detail:"ola",xp:"10",hp:30,defesa:"80",Forte: "ForBulba",Fraco: "Fogo, Grama, Veneno",ataque1:"ATTACK1", ataque2:"ATTACK2",ataque3:"ATTACK3",ataque4:"ATTACK4"),
    .init(id: 4, name: "Venusaur", imageUrl: "1" , type: "Poison",attack:"50",detail:"ola",xp:"10",hp:30,defesa:"80",Forte: "ForBulba",Fraco: "Fogo - Grama - Veneno",ataque1:"ATTACK1", ataque2:"ATTACK2",ataque3:"ATTACK3",ataque4:"ATTACK4")
    ]

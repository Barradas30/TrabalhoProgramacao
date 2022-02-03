//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Admin on 05/01/2022.
//

import SwiftUI

struct Color1 {

func backgroundColor(forType type: String) -> UIColor {
    switch type {
    case "fire": return .systemRed
    default:
        return .systemBlue
    }
  }
}

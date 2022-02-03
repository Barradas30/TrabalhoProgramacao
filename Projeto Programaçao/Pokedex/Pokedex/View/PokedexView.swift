//
//  PokedexView.swift
//  Pokedex
//
//  Created by Admin on 05/01/2022.
//

import SwiftUI

struct PokedexView: View {
//    private let gridItems = [GridItem(.flexible()),
//    GridItem(.flexible())]
    var body: some View {
        List{
            NavigationLink(destination: PokemonDetail(pokemon: MOKE_POKEMON[0])) {
                PokemonCell(pokemon: MOKE_POKEMON[0])
            }
            NavigationLink(destination: PokemonDetail(pokemon: MOKE_POKEMON[1])) {
                PokemonCell(pokemon: MOKE_POKEMON[1])
            }
            NavigationLink(destination: PokemonDetail(pokemon: MOKE_POKEMON[2])) {
                PokemonCell(pokemon: MOKE_POKEMON[2])
            }
            .ignoresSafeArea()
        }
        .navigationTitle("Pokedex")
    }
}



struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}


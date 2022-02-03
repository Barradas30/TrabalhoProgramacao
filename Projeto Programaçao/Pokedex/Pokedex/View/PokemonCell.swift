//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Admin on 05/01/2022.
//

import SwiftUI

struct PokemonCell: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(pokemon.name.capitalized)
                .font(.headline)
                .foregroundColor(.black)
                .padding(.top, 10)
                .padding(.leading,60)
            
            HStack{
                Text(pokemon.type)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green.opacity(0.25))
                    )
                    .frame(width: 200, height: 24)
                
                Image(pokemon.imageUrl)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding([.bottom, .trailing],4)
            }
        }
        .background(Color(UIColor.systemBackground))
        .cornerRadius(12)
        .shadow(color: .green, radius: 6, x: 0.0, y: 0.0)
        
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: MOKE_POKEMON[Int.random(in: 0...4)])
        }
    }


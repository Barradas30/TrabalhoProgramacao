//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Admin on 05/01/2022.
//

import SwiftUI

struct PokemonDetail: View {
    let pokemon: Pokemon
    
    @State private var isFighting: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Image(pokemon.imageUrl)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300.0, height: 300.0, alignment: .top)
                Text(pokemon.detail)
                    .padding(.all, 16)
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(Color(UIColor.secondarySystemBackground))
                    }
                VStack(spacing: 10) {
                    ProgressView(value: Float(pokemon.hp), total: 100.0)
                    {
                        Text("HP")
                            .font(.custom("Courier", size: 20))
                        
                    }
                    .progressViewStyle(.linear)
                    ProgressView(value: Float(pokemon.attack), total: 100.0)
                    {
                        Text("ATAQUE")
                            .font(.custom("Courier", size: 20))
                        
                    }
                    .progressViewStyle(.linear)
                    ProgressView(value: Float(pokemon.defesa), total: 100.0)
                    {
                        Text("DEFESA")
                            .font(.custom("Courier", size: 20))
                        
                    }
                    .progressViewStyle(.linear)
                    ProgressView(value: Float(pokemon.xp), total: 100.0)
                    {
                        Text("LEVEL UP")
                            .font(.custom("Courier", size: 20))
                        
                    }
                    .progressViewStyle(.linear)
                }
                .padding(.all, 16)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color(UIColor.secondarySystemBackground))
                }
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        Text("FORTE CONTRA")
                        Text(pokemon.Forte)
                        Text("FRACO CONTRA")
                        Text(pokemon.Fraco)
                    }
                    Spacer()
                }
                .font(.custom("Courier", size: 20))
                .padding(.all, 16)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color(UIColor.secondarySystemBackground))
                }
                Button(action: {
                    //Fight action here
                    isFighting = true
                }) {
                    Text("Fight!")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color(UIColor.systemRed))
                        .background {
                            Capsule()
                                .frame(width: 140, height: 60)
                                .foregroundColor(Color(UIColor.secondarySystemBackground))
                        }
                }
                .padding(.top, 10)
                Spacer()
            }
            .padding(.horizontal)
            .sheet(isPresented: $isFighting) {
                Batalha(pokemon: pokemon, opponentPokemon: MOKE_POKEMON[Int.random(in: 0...4)])
            }
        }
        .navigationBarTitle(pokemon.name)
    }
}
        
            
            
        
        

struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetail(pokemon: MOKE_POKEMON[0])
    }
}


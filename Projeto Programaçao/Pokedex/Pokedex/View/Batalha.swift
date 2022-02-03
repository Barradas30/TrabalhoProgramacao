//
//  Batalha.swift
//  Pokedex
//
//  Created by Admin on 11/01/2022.
//

import SwiftUI

enum EstadoAtaque {
    case player
    case opponent
    case none
}
enum EstadoBatalha {
    case ongoing
    case playerLost
    case opponentLost
}
struct Batalha: View {
    @Environment(\.presentationMode) var presentationMode
    
    let pokemon: Pokemon
    let opponentPokemon: Pokemon
    @State var Vida: Int = 200
    @State var VidaOpo: Int = 200
    
    @State var estadoataque: EstadoAtaque = EstadoAtaque.none
    @State var isAttacking: Bool = false
    @State var estadobatalha: EstadoBatalha = EstadoBatalha.ongoing
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Pokemon Oponente")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                HStack(alignment: .top) {
                    Image(opponentPokemon.imageUrl)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .overlay {
                            if estadoataque == .player {
                                Color.red
                            }
                        }
                    VStack(alignment: .leading, spacing: 5){
                        Group {
                            Text(opponentPokemon.name)
                                .font(.headline)
                            Text("Ataque: \(opponentPokemon.attack)")
                            Text("Defesa: \(opponentPokemon.defesa)")
                            ProgressView(value: Float(VidaOpo), total: 200.0)
                            {
                                Text("Vida:")
                                    .font(.footnote)
                            }
                            .progressViewStyle(LinearProgressViewStyle(tint: Color.red))
                            ProgressView(value: Float(opponentPokemon.xp), total: 100.0)
                            {
                                Text("Para evoluir:")
                                    .font(.footnote)
                            }
                        }
                    }
                    .offset(y: 5)
                }
                
                Spacer()
                Divider().background(Color.red)
                Spacer()
                
                HStack {
                    Text("Nosso Pokemon")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                HStack(alignment: .top) {
                    Image(pokemon.imageUrl)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .overlay {
                            if estadoataque == .opponent {
                                Color.red
                            }
                        }
                    VStack(alignment: .leading, spacing: 5){
                        Group {
                            Text(pokemon.name)
                                .font(.headline)
                            Text("Ataque: \(pokemon.attack)")
                            Text("Defesa: \(pokemon.defesa)")
                            ProgressView(value: Float(Vida), total: 200.0)
                            {
                                Text("Vida:")
                                    .font(.footnote)
                            }
                            .progressViewStyle(LinearProgressViewStyle(tint: Color.red))
                            ProgressView(value: Float(pokemon.xp), total: 100.0)
                            {
                                Text("Para evoluir:")
                                    .font(.footnote)
                            }
                        }
                    }
                    .offset(y: 5)
                }
                
                Group {
                    HStack{
                        Group{
                            Button(action: {
                                sequenciaataque()
                            }) {
                                Text(pokemon.ataque1)
                                    .padding(.all, 10)
                                    .overlay (
                                        RoundedRectangle(cornerRadius: 10.0)
                                            .stroke(lineWidth: 2.0)
                                            .shadow(color: .blue, radius: 10.0)
                                    )
                            }
                            
                            Button(action: {
                                sequenciaataque()
                            }) {
                                Text(pokemon.ataque2)
                                    .padding(.all, 10)
                                    .overlay (
                                        RoundedRectangle(cornerRadius: 10.0)
                                            .stroke(lineWidth: 2.0)
                                            .shadow(color: .blue, radius: 10.0)
                                    )
                            }
                        }
                    }
                    HStack{
                        Group{
                            Button(action: {
                                sequenciaataque()
                            }) {
                                Text(pokemon.ataque3)
                                    .padding(.all, 10)
                                    .overlay (
                                        RoundedRectangle(cornerRadius: 10.0)
                                            .stroke(lineWidth: 2.0)
                                            .shadow(color: .blue, radius: 10.0)
                                    )
                            }
                            
                            Button(action: {
                                sequenciaataque()
                            }) {
                                Text(pokemon.ataque4)
                                    .padding(.all, 10)
                                    .overlay (
                                        RoundedRectangle(cornerRadius: 10.0)
                                            .stroke(lineWidth: 2.0)
                                            .shadow(color: .blue, radius: 10.0)
                                    )
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            if estadobatalha == .playerLost {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Perdeu. Clique aqui para voltar à Pokedex")
                        .foregroundColor(.primary)
                        .font(.title)
                        .fontWeight(.bold)
                }
            } else if estadobatalha == .opponentLost {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Ganhou. Clique aqui para voltar à Pokedex")
                        .foregroundColor(.primary)
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
        }
        .padding(.top, 20)
        .animation(.default, value: UUID())
        .onChange(of: Vida) {_ in
            if Vida <= 0 {
                estadobatalha = .playerLost
            }
        }
        .onChange(of: VidaOpo) {_ in
            if VidaOpo <= 0 {
                estadobatalha = .opponentLost
            }
        }
    }
    
    func sequenciaataque() {
        if Vida > 0 && !isAttacking {
            isAttacking = true
            estadoataque = .player
            VidaOpo -= Int.random(in: 30...100)
            if VidaOpo < 0 {
                VidaOpo = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                estadoataque = .none
            }
            if VidaOpo > 0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    estadoataque = .opponent
                    Vida -= Int.random(in: 30...100)
                    if Vida < 0 {
                        Vida = 0
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                    estadoataque = .none
                    isAttacking = false
                }
            }
        }
    }
}

struct Batalha_Previews: PreviewProvider {
    static var previews: some View {
        Batalha(pokemon: MOKE_POKEMON[0], opponentPokemon: MOKE_POKEMON[Int.random(in: 0...4)])
    }
}



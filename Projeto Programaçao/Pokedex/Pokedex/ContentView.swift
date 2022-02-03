//
//  ContentView.swift
//  Pokedex
//
//  Created by Admin on 05/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
            Image("Principal")
                .resizable()
                .scaledToFit()
                .frame(width: 300.0, height: 300.0, alignment: .top)
                .padding([.top],20)
                .padding([.bottom],-190)
            NavigationView{
                List {
                    NavigationLink(destination: PokedexView()){
                        Text("Pokedex")
                    }
//                    Text("Batalhas")
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }.background(Color.white)
        
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
  }
}


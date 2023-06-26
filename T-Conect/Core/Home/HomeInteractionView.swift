//
//  HomeInteractionView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 5/06/23.
//

import SwiftUI

struct HomeInteractionView: View {
    var body: some View {
        TabView {
            NavigationView {
                withAnimation {
                    GlobeTabViewHome()
                }
            }
            .tabItem {
                Image(systemName: "globe")
                Text("Descubra")
            }
            
            NavigationView {
                Text("hola")
            }
            .tabItem {
                Image(systemName: "cart.fill")
                Text("Pedidos")
            }
            
            NavigationView {
                Text("hola")
            }
            .tabItem {
                Image(systemName: "airplane")
                Text("Viagens")
            }
            
            NavigationView {
                Text("hola")
            }
            .tabItem {
                Image(systemName: "message.fill")
                Text("Caixa de entrada")
            }
        }
        .accentColor(.purple)
    }
}

struct HomeInteractionView_Previews: PreviewProvider {
    static var previews: some View {
        HomeInteractionView()
    }
}

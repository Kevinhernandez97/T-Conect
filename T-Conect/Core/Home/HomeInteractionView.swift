//
//  HomeInteractionView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 5/06/23.
//

import SwiftUI

struct HomeInteractionView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
            TabView {
                GlobeTabViewHome()
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }
                
                
                CotizacionTabViewHome()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Cotizar")
                }
                
                HistoryTabViewHome()
                .tabItem {
                    Image(systemName: "message")
                    Text("Historial")
                }
                
                ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Mi cuena")
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

//
//  GlobeTabViewHome.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 15/06/23.
//

import SwiftUI

struct GlobeTabViewHome: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
//        if let user = viewModel.currentUser {
            NavigationView {
                CustomNavBarContainerView {
                    ZStack {
                        Color("blancoPrincipal").ignoresSafeArea()
                        ScrollView(.vertical) {
                            VStack(alignment: .leading, spacing: 20) {
                                ItemsHome(titleGroup: "Acciones")
                                
                                SegurosView()
                                
                                CobturasView()
                               
                            }
                            .padding(.horizontal, 8)
                        }
                    }
                }
                .navigationBarHidden(true)
            }
//        }
    }
}

extension GlobeTabViewHome {
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.gray.ignoresSafeArea()
                Text("Hola")
                    .foregroundColor(.black)
            }
        }
    }
}

struct GlobeTabViewHome_Previews: PreviewProvider {
    static var previews: some View {
        GlobeTabViewHome()
    }
}

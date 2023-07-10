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
//                        Color("blancoPrincipal").ignoresSafeArea()
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

struct GlobeTabViewHome_Previews: PreviewProvider {
    static var previews: some View {
        GlobeTabViewHome()
    }
}

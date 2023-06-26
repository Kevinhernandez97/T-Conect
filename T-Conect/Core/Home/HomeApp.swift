//
//  HomeApp.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 5/06/23.
//

import SwiftUI

struct HomeApp: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if viewModel.userSession != nil {
            HomeInteractionView()
        } else {
            HomeIntroduction()
        }
    }
}

struct HomeApp_Previews: PreviewProvider {
    static var previews: some View {
        HomeApp()
    }
}

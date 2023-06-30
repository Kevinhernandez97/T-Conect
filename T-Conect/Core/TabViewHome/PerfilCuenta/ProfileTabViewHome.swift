//
//  ProfileTabViewHome.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 29/06/23.
//

import SwiftUI

struct ProfileTabViewHome: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Button {
                viewModel.signOut()
            } label: {
                HStack {
                    Image(systemName: "arrow.left.circle.fill")
                    Text("Sign out")
                }
            }
        }
    }
}

struct ProfileTabViewHome_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabViewHome()
    }
}

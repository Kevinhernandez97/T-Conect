//
//  ProfileView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 15/06/23.
//

import SwiftUI

struct ProfileView: View {
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

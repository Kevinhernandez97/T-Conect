//
//  NavBarTitleView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 01/07/23.
//

import SwiftUI

struct NavBarTitleView: View {
    var title: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.system(size: 25))
                    .foregroundColor(Color.white)
            })

            Spacer()


            Text("\(title)")
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.semibold)
            Spacer()
        }
        .padding()
        .font(.headline)
        .background(
            Color("purplePrincipal").ignoresSafeArea(edges: .top)
        )
        .shadow(color: Color.black.opacity(0.3), radius: 10)
    }
}

struct NavBarTitleView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarTitleView(title: "Example")
    }
}

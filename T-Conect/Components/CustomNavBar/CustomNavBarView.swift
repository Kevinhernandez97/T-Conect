//
//  CustomNavBarView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 27/06/23.
//

import SwiftUI

struct CustomNavBarView: View {
    var body: some View {
        HStack {
            Text("Insurane!")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 25))
                    .foregroundColor(Color.white)
            })
        
        }
        .padding()
        .font(.headline)
        .background(
            Color("purplePrincipal").ignoresSafeArea(edges: .top)
        )
        .shadow(color: Color.black.opacity(0.7), radius: 10)
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarView()
    }
}

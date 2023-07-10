//
//  CentralAyudaView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 27/06/23.
//

import SwiftUI

struct CentralAyudaView: View {
    var body: some View {
        NavBarTitleContainerView(content: {
            ScrollView {
                Text("hola")
            }
        }, navBarData: NavBarTitleContainerView.NavBarData(title: "Central de ayuda"))
            .navigationBarHidden(true)
    }
}

struct CentralAyudaView_Previews: PreviewProvider {
    static var previews: some View {
        CentralAyudaView()
    }
}

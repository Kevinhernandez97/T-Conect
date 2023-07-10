//
//  cambioClaveView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 27/06/23.
//

import SwiftUI

struct CambioClaveView: View {
    var body: some View {
        NavBarTitleContainerView(content: {
            ScrollView {
                Text("hola")
            }
        }, navBarData: NavBarTitleContainerView.NavBarData(title: "Cambio de contraseña"))
            .navigationBarHidden(true)
    }
}

struct CambioClaveView_Previews: PreviewProvider {
    static var previews: some View {
        CambioClaveView()
    }
}

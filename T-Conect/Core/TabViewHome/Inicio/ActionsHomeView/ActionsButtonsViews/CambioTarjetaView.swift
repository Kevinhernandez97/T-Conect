//
//  CambioTarjetaView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 27/06/23.
//

import SwiftUI

struct CambioTarjetaView: View {
    var body: some View {
        NavBarTitleContainerView(content: {
            ScrollView {
                Text("hola")
            }
        }, navBarData: NavBarTitleContainerView.NavBarData(title: "Cambiar metodo de pago"))
            .navigationBarHidden(true)
    }
}

struct CambioTarjetaView_Previews: PreviewProvider {
    static var previews: some View {
        CambioTarjetaView()
    }
}

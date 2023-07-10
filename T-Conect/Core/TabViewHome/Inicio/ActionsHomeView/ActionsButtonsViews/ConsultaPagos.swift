//
//  ConsultaPagos.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 27/06/23.
//

import SwiftUI

struct ConsultaPagos: View {
    var body: some View {
        NavBarTitleContainerView(content: {
            ScrollView {
                Text("hola")
            }
        }, navBarData: NavBarTitleContainerView.NavBarData(title: "Consultar pagos"))
            .navigationBarHidden(true)
    }
}

struct ConsultaPagos_Previews: PreviewProvider {
    static var previews: some View {
        ConsultaPagos()
    }
}

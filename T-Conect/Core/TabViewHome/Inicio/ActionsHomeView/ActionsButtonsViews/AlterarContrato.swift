//
//  alterarContrato.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 27/06/23.
//

import SwiftUI

struct AlterarContrato: View {
    var body: some View {
        NavBarTitleContainerView(content: {
            ScrollView {
                Text("hola")
            }
        }, navBarData: NavBarTitleContainerView.NavBarData(title: "Modificar contrato"))
            .navigationBarHidden(true)
    }
}

struct AlterarContrato_Previews: PreviewProvider {
    static var previews: some View {
        AlterarContrato()
    }
}

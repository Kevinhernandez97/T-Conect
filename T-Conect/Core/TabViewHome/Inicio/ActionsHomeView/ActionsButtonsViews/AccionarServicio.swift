//
//  AccionarServicio.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 27/06/23.
//

import SwiftUI

struct AccionarServicio: View {
    @StateObject var serviceData = ServiceData()
    
    var body: some View {
        NavBarTitleContainerView(content: {
            ScrollView {
                ForEach(serviceData.servicesApp) { serviceApp in
                    VStack {
                        NavigationLink {
                            serviceApp.option.destinationView
                        } label: {
                            VStack {
                                CoberturasOpciones(image: "\(serviceApp.imageName)", title: "\(serviceApp.title)")
                                    .padding(.bottom, 5)
                            }
                            .overlay(
                                Text("Saiba mais")
                                    .padding([.leading], 35)
                                    , alignment: .bottomLeading
                            )
                        }
                        
                        Divider()
                    }
                    .padding(.horizontal, 10)
                }
            }
        }, navBarData: NavBarTitleContainerView.NavBarData(title: "Asistencias y coberturas"))
            .navigationBarHidden(true)
    }
}

struct AccionarServicio_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AccionarServicio()
                .previewDevice("iPhone 13 Pro")
        }
    }
}

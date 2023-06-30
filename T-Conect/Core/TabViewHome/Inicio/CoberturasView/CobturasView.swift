//
//  CobturasView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 30/06/23.
//

import SwiftUI

struct CobturasView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Mis asistencias")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.bottom, 0.3)

            Text("Servicos disponibles para usar")
                .font(.system(size: 15))
                .foregroundColor(.gray)
            
            
            VStack {
                NavigationLink {
                    
                } label: {
                    CoberturasOpciones(image: "car.fill", title: "Servicio de grua")
                }
                
                Divider()
                
                NavigationLink {
                    
                } label: {
                    CoberturasOpciones(image: "car.2", title: "AutoSocorro")
                }
                
                
                Divider()
                
                NavigationLink {
                    
                } label: {
                    CoberturasOpciones(image: "wrench.and.screwdriver", title: "Reparaciones completas")
                }
               
                
                NavigationLink {
                    
                } label: {
                    HStack {
                        Text("Asistencias de su plan")
                            .fontWeight(.semibold)
                            .tracking(1)
                        Image(systemName: "arrow.right")
                        
                        Spacer()
                    }
                    .font(.system(size: 15))
                    .foregroundColor(Color("purplePrincipal"))
                }
                .padding(.top, 20)
            }
            .padding(.horizontal, 10)

            
        }
        
        Rectangle()
            .frame(width: .infinity, height: 8)
            .foregroundColor(Color.gray.opacity(0.2))
            .padding(.horizontal, -8)
    }
}

struct CoberturasOpciones: View {
    let image: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "\(image)")
                .foregroundColor(Color("purplePrincipal"))
            Text("\(title)")
                .fontWeight(.light)
                .foregroundColor(.black)
            
            Spacer()
            
            Image(systemName: "arrow.right")
                .font(.system(size: 15))
                .foregroundColor(.orange)
        }
        .frame(width: .infinity, height: 60)
    }
}

struct CobturasView_Previews: PreviewProvider {
    static var previews: some View {
        CobturasView()
    }
}

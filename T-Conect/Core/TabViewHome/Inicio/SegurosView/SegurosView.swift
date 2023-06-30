//
//  SegurosView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 30/06/23.
//

import SwiftUI

struct SegurosView: View {
    var body: some View {
     
            Text("Mis seguros")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            NavigationLink {
                
            } label: {
                VStack {
                    HStack {
                        Image(systemName: "car.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .foregroundColor(Color.green)
                            .padding(8)
                        
                        Text("Carro")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                            .fontWeight(.semibold)
                        
                        Text("Activo")
                            .fontWeight(.semibold)
                            .font(.system(size: 13))
                            .frame(width: 60, height: 20)
                            .foregroundColor(.green)
                            .background(Color.green.opacity(0.2))
                            .cornerRadius(20)
                        Spacer()
                    }
                    
                    VStack(alignment: .leading) {
                        Text("2008 GRIFFE 1.6 FLEX 16V 5P AUT. (Gasolina / flex)")
                        Text("FPT-S633")
                        Text("Contrato: 5003110868428")
                    }
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                }
                .padding(10)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
                .cornerRadius(11)
                .shadow(color: Color.gray.opacity(0.3), radius: 10)
            }
        
    }
}

struct SegurosView_Previews: PreviewProvider {
    static var previews: some View {
        SegurosView()
    }
}

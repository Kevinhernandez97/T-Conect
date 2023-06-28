//
//  ItemsHome.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 13/06/23.
//

import SwiftUI

enum OptionsMenu {
    case accionaServicio
    case cambiarTatjeta
    case consultarPagos
    case alterarContrato
    case hablarConInsurane
    case cambioDeClave
    case centralDeAyuda

    var destinationView: AnyView {
        switch self {
        case .accionaServicio:
            return AnyView(Text("Vista de Accionar servicio"))
        case .cambiarTatjeta:
            return AnyView(Text("Vista de Cambiar tarjeta"))
        case .consultarPagos:
            return AnyView(Text("Vista de Consultar pagos"))
        case .alterarContrato:
            return AnyView(Text("Vista de Alterar contrato"))
        case .hablarConInsurane:
            return AnyView(Text("Vista de Hablar con Insurane"))
        case .cambioDeClave:
            return AnyView(Text("Vista de Cambio de clave"))
        case .centralDeAyuda:
            return AnyView(Text("Vista de Central de ayuda"))
        }
    }
}


struct ItemsHome: View {
    @State var titleGroup: String
    @State var isShowing = false
    
    let imagesData = [
        ImageData(imageString: "exclamationmark.circle", title: "Accionar servicio", option: .accionaServicio),
        ImageData(imageString: "creditcard.fill", title: "Cambiar tarjeta", option: .cambiarTatjeta),
        ImageData(imageString: "calendar", title: "Consultar pagos", option: .consultarPagos),
        ImageData(imageString: "doc.fill", title: "Alterar contrato", option: .alterarContrato),
        ImageData(imageString: "bubble.right.fill", title: "Hablar con Insurane", option: .hablarConInsurane),
        ImageData(imageString: "lock", title: "Cambio de clave", option: .cambioDeClave),
        ImageData(imageString: "questionmark.circle", title: "Central de ayuda", option: .centralDeAyuda)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(titleGroup)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            .padding(.bottom, 8)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 8) {
                    ForEach(imagesData) { imageData in
                        NavigationLink {
                            imageData.option.destinationView
                        } label: {
                            VStack {
                                Image(systemName: "\(imageData.imageString)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45)
                                    .foregroundColor(Color("purplePrincipal"))
                                    .padding(.bottom, 8)
                                
                                Text(imageData.title)
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                                    .lineLimit(nil)
                                    .multilineTextAlignment(.center)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding(8)
                            .frame(maxWidth: 110, maxHeight: .infinity)
                            .background(.white)
                            .cornerRadius(11)
                            .shadow(color: Color.black.opacity(0.2), radius: 3)
                        }
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
            }

        }
        .padding(.top, 10)
    }
}

struct ImageData: Identifiable {
    let id = UUID()
    let imageString: String
    let title: String
    let option: OptionsMenu
}

struct ItemsHome_Previews: PreviewProvider {
    static var previews: some View {
        ItemsHome(titleGroup: "")
    }
}

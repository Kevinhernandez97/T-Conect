//
//  CobturasView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 30/06/23.
//

import SwiftUI

class ServiceData: ObservableObject {
    struct ServiceApp: Identifiable {
        let id = UUID()
        let imageName: String
        let title: String
        let option: OptionServices
    }
    
    let servicesApp = [
        ServiceApp(imageName: "car.fill", title: "Servicio de grua", option: .servicioGrua),
        ServiceApp(imageName: "bolt.car", title: "AutoSocorro", option: .autoSocorro),
        ServiceApp(imageName: "car.side", title: "Reparaciones completas", option: .reparacionesCompletas),
        ServiceApp(imageName: "fuelpump.fill", title: "Tanque vacio", option: .tanqueVacio),
        ServiceApp(imageName: "car.side", title: "Cambio de llantas", option: .cambioLlantas),
        ServiceApp(imageName: "steeringwheel.and.key", title: "Cerrajero automotivo", option: .cerrajeroAutomotriz),
        ServiceApp(imageName: "car.side.front.open", title: "Repracaion latoneria", option: .reparacionLatoneria)
    ]
    
    enum OptionServices {
        case servicioGrua
        case autoSocorro
        case reparacionesCompletas
        case tanqueVacio
        case cambioLlantas
        case cerrajeroAutomotriz
        case reparacionLatoneria

        var destinationView: AnyView {
            switch self {
            case .servicioGrua:
                return AnyView(Text("servicioGrua"))
            case .autoSocorro:
                return AnyView(Text("autoSocorro"))
            case .reparacionesCompletas:
                return AnyView(Text("reparacionesCompletas"))
            case .tanqueVacio:
                return AnyView(Text("tanqueVacio"))
            case .cambioLlantas:
                return AnyView(Text("cambioLlantas"))
            case .cerrajeroAutomotriz:
                return AnyView(Text("cerrajeroAutomotriz"))
            case .reparacionLatoneria:
                return AnyView(Text("reparacionLatoneria"))
            }
        }
    }
}

struct CobturasView: View {
    @StateObject var serviceData = ServiceData()
    
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
                
                ForEach(serviceData.servicesApp.prefix(3)) { serviceApp in
                    NavigationLink {
                        serviceApp.option.destinationView
                    } label: {
                        CoberturasOpciones(image: "\(serviceApp.imageName)", title: "\(serviceApp.title)")
                    }
                }
                
                NavigationLink {
                    AccionarServicio()
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

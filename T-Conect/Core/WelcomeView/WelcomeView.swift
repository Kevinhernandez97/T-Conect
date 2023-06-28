//
//  WelcomeView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 31/05/23.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var currentPage: CGFloat
    @Binding var isShowing: Bool
    
    var body: some View {
        GeometryReader { g in
            HStack(spacing: 0) {
                FeaturedItem()
                    .frame(width: g.size.width, height: g.size.height)
                
                FeaturedItem2()
                    .frame(width: g.size.width, height: g.size.height)
                
                FeaturedItem3()
                    .frame(width: g.size.width, height: g.size.height)
            }
            .offset(x: -(self.currentPage * g.size.width))
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.width > 80 {
                        if self.currentPage > 0 {
                            withAnimation {
                                self.currentPage -= 1
                            }
                        }
                    } else if value.translation.width < -80 {
                        if self.currentPage < 2 {
                            withAnimation {
                                self.currentPage += 1
                            }
                        }
                    }
                }
        )
                
        PageIndicator(indicatorPage: $currentPage, isShowing: $isShowing)

    }
}


struct FeaturedItem: View {
    var body: some View {
        VStack {
            
            Image("image")
                .resizable()
                .scaledToFill()
                .background(.blue)
            
            VStack(alignment: .leading) {
                Spacer()
                
                Text("Bienvenido a Insurance")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                Text("Personalice su seguro y contrate en pocos minutos")
                    .font(.headline)
                    .foregroundColor(Color(.systemGray4))
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("purplePrincipal"))
        .ignoresSafeArea()
    }
}

struct FeaturedItem2: View {
    var body: some View {
        VStack {
            
            Image("image")
                .resizable()
                .scaledToFill()
                .background(.blue)
        
            VStack(alignment: .leading) {
                
                Spacer()
                
                Text("Seguro de vehiculo")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                Text("Personalice el seguro a su necesidad, agregue o quite servicios que desee.")
                    .font(.headline)
                    .foregroundColor(Color(.systemGray4))
                
                Spacer()
                
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("purplePrincipal"))
        .ignoresSafeArea()
    }
}

struct FeaturedItem3: View {
    var body: some View {
        VStack {
            Image("image")
                .resizable()
                .scaledToFill()
                .background(.blue)
            
            VStack(alignment: .leading) {
                
                Spacer()
                
                Text("Seguro Residencial")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                Text("Tu casa es tu camino. Tu seguro residencial online tambien puede ser")
                    .font(.headline)
                    .foregroundColor(Color(.systemGray4))
                
                Spacer()
                
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("purplePrincipal"))
        .ignoresSafeArea()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(currentPage: .constant(0), isShowing: .constant(true))
    }
}

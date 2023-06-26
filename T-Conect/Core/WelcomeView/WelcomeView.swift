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
                
                Text("Bem-Vindo ao T-Conect")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                Text("A maior comunidade de compras  e viagens do mundo.")
                    .font(.headline)
                    .foregroundColor(Color(.systemGray4))
            }
            .padding(.bottom, 80)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBlue))
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
            
            Text("Loja do exterior")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 5)
            Text("De jogos a eletronicos, accese qualquer produto do exterior, entregue por viajantes.")
                .font(.headline)
                .foregroundColor(Color(.systemGray4))
        }
        .padding(.bottom, 80)
    }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBlue))
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
                Text("Ganhe Dinhheriro Viajando")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                Text("Ganhe dinheiro toda vez que voce viajar, entregando produtos para os moradores ao longo do caminho.")
                    .font(.headline)
                    .foregroundColor(Color(.systemGray4))
            }
            .padding(.bottom, 80)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBlue))
        .ignoresSafeArea()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(currentPage: .constant(0), isShowing: .constant(true))
    }
}

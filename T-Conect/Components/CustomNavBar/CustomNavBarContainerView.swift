//
//  CustomNavBarContainerView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 27/06/23.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView()
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarContainerView {
            ZStack {
                Color.gray.ignoresSafeArea()
                
                Text("Hello, World")
                    .foregroundColor(.white)
            }
        }
    }
}

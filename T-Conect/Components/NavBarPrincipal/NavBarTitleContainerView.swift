//
//  NavBarTitleContainerView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 01/07/23.
//

import SwiftUI

struct NavBarTitleContainerView<Content: View>: View {
    
    let content: Content
    
    struct NavBarData {
        var title: String
    }
    
    let navBarData: NavBarData
    
    init(@ViewBuilder content: () -> Content, navBarData: NavBarData) {
        self.content = content()
        self.navBarData = navBarData
    }
    
    var body: some View {
        VStack(spacing: 0) {
            NavBarTitleView(title: navBarData.title)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct NavBarTitleContainerView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarTitleContainerView(content: {
            ZStack {
                Color.gray.ignoresSafeArea()
                
                Text("Hello, World")
                    .foregroundColor(.white)
            }
        }, navBarData: NavBarTitleContainerView.NavBarData(title: "Title"))
    }
}

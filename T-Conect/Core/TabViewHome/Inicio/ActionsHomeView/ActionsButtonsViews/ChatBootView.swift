//
//  ChatBootView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 27/06/23.
//

import SwiftUI

struct ChatBootView: View {
    var body: some View {
        NavBarTitleContainerView(content: {
            ScrollView {
                Text("hola")
            }
        }, navBarData: NavBarTitleContainerView.NavBarData(title: "Chat"))
            .navigationBarHidden(true)
    }
}

struct ChatBootView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBootView()
    }
}

//
//  HomeIntroduction.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 30/05/23.
//

import SwiftUI

struct HomeIntroduction: View {
    @State private var currentPage: CGFloat = 0
    @State private var isShowing = false
    
    var body: some View {
        ZStack {
            if isShowing {
                LoginView()
            } else {
                WelcomeView(currentPage: $currentPage, isShowing: $isShowing)
            }
        }
    }
}

struct HomeInitSession: View {
    var body: some View {
        VStack {
            
        }
    }
}

struct HomeIntroduction_Previews: PreviewProvider {
    static var previews: some View {
        HomeIntroduction()
    }
}

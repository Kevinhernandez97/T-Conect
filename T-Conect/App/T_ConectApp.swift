//
//  T_ConectApp.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 30/05/23.
//

import SwiftUI
import Firebase

@main
struct T_ConectApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeApp()
                .environmentObject(viewModel)
        }
    }
}

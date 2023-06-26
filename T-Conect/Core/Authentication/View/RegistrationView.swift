//
//  RegistrationView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 4/06/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Spiral()
                .stroke(Color(.systemBlue), lineWidth: 4)
                .frame(width: 100, height: 100)
                .padding(.top, 20)
            
            VStack(spacing: 24) {
                InputView(text: $email, title: "Email Address", placeholder: "example@hotmail.com", isSecureField: true)
                    .keyboardType(.emailAddress)
                
                InputView(text: $fullName, title: "Full Name", placeholder: "Enter your name", isSecureField: true)
                
                InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: false)
                
                ZStack(alignment: .trailing) {
                    InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: false)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .foregroundColor(Color(.systemGreen))
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email, password: password, fullName: fullName)
                }
            } label: {
                HStack {
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                .foregroundColor(.white)
                
            }
            .background(Color(.systemBlue))
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .cornerRadius(10)
            .padding(.top, 30)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an acount?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
                .padding(.bottom, 20)
            }
        }
        .navigationBarHidden(true)
    }
}

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullName.isEmpty
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

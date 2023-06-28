//
//  ForgotPasswordView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 12/06/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email = ""
    @State private var isShowingSend = false
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Spiral()
                .stroke(Color(.white), lineWidth: 4)
                .frame(width: 100, height: 100)
                .padding(.top, 50)
            
            if !isShowingSend {
                VStack(spacing: 15) {
                    InputView(text: $email, title: "Email Address", placeholder: "Enter the email associated with your acount", isSecureField: true)
                        .keyboardType(.emailAddress)
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Button {
                    Task {
                        try await viewModel.forgotPassword(withEmail: email)
                    }
                    isShowingSend = true
                } label: {
                    HStack {
                        Text("SEND RESET LINK")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    .foregroundColor(.black)
                }
                .background(Color(red: 255/255.0, green: 166/255.0, blue: 47/255.0))
                .disabled(!formIsValid || isShowingSend)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top, 30)
            
            } else {
                
                Spacer()
                
                VStack(spacing: 15) {
                    Image(systemName: "paperplane.fill")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                    
                    Text("Si tu correo esta inscrito en nuestra base de datos recibiras un link para restabelecer la contrasena")
                        .font(.headline)
                        .foregroundColor(Color(.systemGray))
                }
                .padding(.horizontal)
                
                Spacer()
            }
            
            
            
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Image(systemName: "arrow.left")
                    Text("Back to Login")
                        .fontWeight(.bold)
                }
                .foregroundColor(.white)
                .font(.system(size: 14))
                .padding(.bottom, 20)
            }
        }
        .background(Color("purplePrincipal"))
        .ignoresSafeArea(.all)
        .navigationBarHidden(true)
    }
}

extension ForgotPasswordView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}

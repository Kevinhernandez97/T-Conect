//
//  LoginView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 2/06/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isSecureField = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                // Logo
    
                    Spiral()
                        .stroke(Color(.systemBlue), lineWidth: 4)
                        .frame(width: 100, height: 100)
                        .padding(.top, 20)
               
                
                // form fields
                VStack(spacing: 15) {
                    InputView(text: $email, title: "Email Address", placeholder: "name@expample.com", isSecureField: true)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    HStack {
                        InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: isSecureField)
                        
                        Spacer()
                        
                        Button(action: {
                            self.isSecureField.toggle()
                        }) {
                            Image(systemName: self.isSecureField ? "eye" : "eye.slash" )
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)
                
                // Forgot Button
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink {
                        ForgotPasswordView()
                    } label: {
                        HStack {
                            Text("Forgot Password?")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(.systemBlue))
                        }
                    }
                }
                .padding()
                
                // sign in button
                
                Button {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
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
                .opacity(0.8)

                
                Spacer()
                
                // sign up button
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an acount?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                    .padding(.bottom, 20)
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
        .onTapGesture {
            hidenKeyboard()
        }
    }
    
    private func hidenKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct Spiral: Shape {
    func path(in rect: CGRect) -> Path {
        let centerX = rect.midX
        let centerY = rect.midY
        let radius = min(rect.width, rect.height) / 2
        let totalTurns: CGFloat = 4
        let totalSteps: CGFloat = 100
        let anglePerStep = totalTurns * 2 * CGFloat.pi / totalSteps
        
        var path = Path()
        
        for step in 0...Int(totalSteps) {
            let currentRdius = radius * CGFloat(step) / totalSteps
            let currentAngle = anglePerStep * CGFloat(step)
            let x = centerX + currentRdius * cos(currentAngle)
            let y = centerY + currentRdius * sin(currentAngle)
            
            if step == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        return path
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//
//  InputView.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 2/06/23.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(Color(.gray))
                .fontWeight(.semibold)
                .font(.footnote)
            
                if isSecureField {
                    TextField(placeholder, text: $text)
                        .foregroundColor(Color.white)
                        .font(.system(size: 14))
                } else {
                    SecureField(placeholder, text: $text)
                        .foregroundColor(Color.white)
                        .font(.system(size: 14))
                }
            
            Divider()
                .background(Color.white)
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "Email Addres", placeholder: "example@user.com")
    }
}

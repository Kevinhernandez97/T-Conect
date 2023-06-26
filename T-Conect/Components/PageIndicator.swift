//
//  PageIndicator.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 31/05/23.
//

import SwiftUI

struct PageIndicator: View {
    @Binding var indicatorPage: CGFloat
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(alignment: .center, spacing: 10) {
                Button(action: {
                        self.isShowing = false
                    }) {
                        Text("Pule")
                            .fontWeight(.medium)
                            .foregroundColor(Color(.systemGray4))
                            .padding(.leading, 40)
                    }
                
                    Spacer()
                    
                    
                HStack {
                    ForEach(0..<3) { index in
                        if index == Int(indicatorPage) {
                            Capsule()
                                .frame(width: 18, height: 9)
                                .foregroundColor(Color(.systemGray4))
                                .scaleEffect(1.3)
                                .animation(.spring(), value: indicatorPage)
                           
                            
                        } else {
                            Circle()
                                .frame(width: 12, height: 10)
                                .foregroundColor(.black)
                                .opacity(0.5)
                             
                        }
                        
                    }
                }
                .padding(.leading, 35)
                
                
                Spacer()
                            
                VStack {
                    Button(action: {
                        withAnimation {
                            if self.indicatorPage < 2 {
                                self.indicatorPage += 1
                            } else if self.indicatorPage == 2 {
                                self.isShowing = false
                            }
                        }
                    }) {
                        ZStack {
                            if self.indicatorPage < 2 {
                                Circle()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(Color(.systemGray4))
                                    .shadow(color: .gray, radius: 10)
                                
                                Image(systemName: "chevron.right")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                            } else if self.indicatorPage == 2 {
                                Rectangle()
                                    .frame(width: 70, height: 40)
                                    .foregroundColor(Color(.systemGray4))
                                    .cornerRadius(10)
                                    .shadow(color: .gray, radius: 10)
                                
                                Text("Inicie")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .frame(width: 100, height: 100)
                }

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct PageIndicator_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicator(indicatorPage: .constant(0), isShowing: .constant(true))
    }
}

//
//  GlobeTabViewHome.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 15/06/23.
//

import SwiftUI

struct GlobeTabViewHome: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Text("Descubra")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    Text("""
                 Ola \(user.fullName) ao T-Conect!, use o botao "Comecar a comprar" para escolher ou adicionar un produto que deseja, ou clique em "adiconar uma viagem" e comece a ganhar!
                """)
                    .font(.subheadline)
                    .foregroundColor(Color(.systemGray))
                    .padding(.top, 5)
                    
                    HStack(spacing: 15) {
                        Button {
                            
                        } label: {
                            HStack {
                                Text("Comece a comprar")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.black)
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                Image(systemName: "cart")
                                    .foregroundColor(.white)
                                    .padding(.vertical, 40)
                                    .padding(.trailing, 10)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: 70)
                        .background(Color(red: 0.6, green: 0.5, blue: 0.9))
                        .cornerRadius(10)
                        
                        Button {
                            
                        } label: {
                            HStack {
                                Text("Adicione numa viagem")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.black)
                                    .padding(.leading, 10)
                                
                                
                                Spacer()
                                
                                Image(systemName: "airplane")
                                    .foregroundColor(.white)
                                    .padding(.vertical, 40)
                                    .padding(.trailing, 10)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: 70)
                        .background(Color(red: 0.6, green: 0.5, blue: 0.9))
                        .cornerRadius(10)
                    }
                    .padding(.top, 20)
                }
                .padding(.horizontal)
                .padding(.top, 20)
                .padding(.bottom, 20)
                
                
                VStack {
                    ItemsHome(titleGroup: "Mais Comprados no Exterior")
                    
                    ItemsHome(titleGroup: "Favoritos de Tempos Frios")
                    
                    ItemsHome(titleGroup: "Explore a nova linh de iPhone")
                    
                    ItemsHome(titleGroup: "Explore mas productos")
                }
                .padding([.leading, .bottom, .top])
                .background(Color(red: 0.4, green: 0.3, blue: 0.7).opacity(0.2))
                
               
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("T-Conect")
                        .font(.title)
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        Text(user.initials)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 38, height: 38)
                            .background(Color(red: 0.6, green: 0.5, blue: 0.9))
                            .clipShape(Circle())
                    }
                }
            }
            .background(Color(.systemGray6))
        }
    }
}

struct GlobeTabViewHome_Previews: PreviewProvider {
    static var previews: some View {
        GlobeTabViewHome()
    }
}

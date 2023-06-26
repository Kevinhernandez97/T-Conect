//
//  ItemsHome.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 13/06/23.
//

import SwiftUI

struct ItemsHome: View {
    @State var titleGroup: String
    @State var isShowing = false
    
    let imagesData = [
        ImageData(url: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-14-pro-finish-select-202209-6-7inch_AV1?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1671474921740", titleCompany: "APPLE", titleProduct: "iPhone 14 pro max - 256GB", price: "8.900 BRL"),
        ImageData(url: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MQDY3ref_VW_34FR+watch-49-titanium-ultra_VW_34FR_WF_CO+watch-face-49-alpine-ultra_VW_34FR_WF_CO_GEO_BR?wid=700&hei=700&trim=1%2C0&fmt=p-jpg&qlt=95&.v=1683224241054", titleCompany: "APPLE", titleProduct: "Pulseira loop Alpina laranja", price: "10.900 BRL"),
        ImageData(url: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp-spacegray-gallery1-202206?wid=2000&hei=1537&fmt=jpeg&qlt=95&.v=1664558461719", titleCompany: "APPLE", titleProduct: "MacBook Pro de 13 polegadas", price: "12.299 BRL"),
        ImageData(url: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-pro-model-select-gallery-1-202212?wid=2560&hei=1440&fmt=p-jpg&qlt=95&.v=1667594167948", titleCompany: "APPLE", titleProduct: "iPad Pro", price: "11.499 BRL"),
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text(titleGroup)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Image(systemName: "speaker.fill")
                    .foregroundColor(.yellow)
                
                Spacer()
                
                NavigationLink {
                    ScrollView(.vertical) {
                            ForEach(imagesData) { imageData in
                                if let imageUrl = URL(string: imageData.url) {
                                    AsyncImage(url: imageUrl) { image in
                                        Section {
                                            HStack {
                                                VStack(alignment: .leading) {
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        .frame(width: 70, height: 70)
                                                        .cornerRadius(10)
                                                }
                                                .padding()
                                                
                                                VStack(alignment: .leading) {
                                                    Text(imageData.titleCompany)
                                                        .font(.system(size: 15))
                                                        .fontWeight(.semibold)
                                                        .foregroundColor(.gray)
                                                    
                                                    Text(imageData.titleProduct)
                                                        .font(.system(size: 20))
                                                        .foregroundColor(.black)
                                                }
                                                 
                                                VStack {
                                                    Text("precio del producto")
                                                        .font(.subheadline)
                                                        .foregroundColor(.gray)
                                                        .padding(.top)
                                                    
                                                    Text(imageData.price)
                                                        .font(.title2)
                                                        .fontWeight(.semibold)
                                                }
                                            }
                                        }
                                        .frame(maxWidth: .infinity, maxHeight: 170)
                                        .background(Color(.systemGray6).opacity(0.8))
                                        .cornerRadius(10)
                                        .padding()
                                        
                                    }  placeholder: {
                                        ProgressView()
                                    }
                                }
                            }
                            .navigationBarTitle(titleGroup)
                        }
                    .background(Color(red: 0.4, green: 0.3, blue: 0.7).opacity(0.2))
                } label : {
                    Text("Ver tudo")
                        .font(.subheadline)
                        .foregroundColor(Color(.systemGray))
                        .padding(.trailing, 8)
                }
            }
            .padding(.bottom, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(imagesData) { imageData in
                        loadImageFromUrl(imageData: imageData)
                    }
                }
            }
        }
        .padding(.bottom, 20)
        .onAppear {
            let imageURLs = imagesData.compactMap { URL(string: $0.url) }
            ImageCache.shared.preloadImages(withURLs: imageURLs)
        }
    }
    
    @ViewBuilder
    func loadImageFromUrl(imageData: ImageData) -> some View {
        if let imageUrl = URL(string: imageData.url) {
            AsyncImage(url: imageUrl) { image in
                VStack {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 130, height: 130)
             
                            .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        Text(imageData.titleCompany)
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Text(imageData.titleProduct)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                        
                        Text("precio del producto")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.top)
                        
                        Text(imageData.price)
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    .padding(.vertical, 8)
                }
                .padding(5)
                .frame(width: 170, height: 330)
                .background(Color(.systemGray6).opacity(0.8))
                .cornerRadius(10)

                
            } placeholder: {
                ProgressView()
            }
        }
    }
}

struct ImageData: Identifiable {
    let id = UUID()
    let url: String
    let titleCompany: String
    let titleProduct: String
    let price: String
}

struct ItemsHome_Previews: PreviewProvider {
    static var previews: some View {
        ItemsHome(titleGroup: "")
    }
}

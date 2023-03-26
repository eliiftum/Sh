//
//  ProductDetailView.swift
//  SwiftUIShopAPP
//
//  Created by Elif Tum on 31.01.2023.
//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
    @StateObject var viewmodel = ProductDetailVM()
    let id : Int
    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            VStack {
                if viewmodel.product == nil  {
                    ProgressView()
                }
                else {
                    KFImage(URL(string: viewmodel.product?.image ?? "")!)
                        .resizable()
                                .frame(width: UIScreen.width * 0.85,height: UIScreen.height * 0.40)
                                .padding(.all,10)
                    VStack {
                        Text("\(viewmodel.product?.price ?? 0.0) TL")
                        Text(viewmodel.product?.title ?? "")
                            .font(.title)
                            .padding()
                        Text(viewmodel.product?.description ?? "")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .padding()
                        Text(viewmodel.product?.category ?? "")
                            .font(.title3)
                            .foregroundColor(.purple)
                            .padding()
                    }
                    Spacer()
                }
            }
        }
        .onAppear {
            viewmodel.getProduct(productId: id)
        }
    }
    
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(id: 1)
    }
}

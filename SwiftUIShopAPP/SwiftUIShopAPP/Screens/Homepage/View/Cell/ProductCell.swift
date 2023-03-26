//
//  ProductCell.swift
//  SwiftUIShopAPP
//
//  Created by Elif Tum on 28.01.2023.
//

import Foundation
import SwiftUI
import Kingfisher
struct ProductCell :  View {
    let product : ProductDetailModel
    var body : some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.width * 0.9,height: UIScreen.height * 0.35)
                .foregroundColor(.white)
                .border(.red,width: 2)
                .cornerRadius(5)
                .overlay {
                    VStack {
                        Spacer(minLength: 5)
                        KFImage(URL(string: product.image ?? "")!)
                            .resizable()
//                            .frame(width: UIScreen.width * 0.85,height: UIScreen.height * 0.10)
                            .aspectRatio( contentMode: .fit)
                        Text(product.title ?? "")
                        HStack {
                            Text("Category:")
                            Text(product.category ?? "")
                        }
                        HStack {
                            Text("Fiyat:")
                            Text("\(product.price ?? 0.0) TL")
                        }
                        Spacer(minLength: 5)
                    }
                }
        }
    }
}
//struct ProductCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCell(product: ProductDetailModel)
//    }
//}

//
//  PDViewModel.swift
//  SwiftUIShopAPP
//
//  Created by Elif Tum on 31.01.2023.
//

import Foundation

class ProductDetailVM : ObservableObject { //published keywordünü kullanabilmek için observabledan miras aldık
    @Published var product : ProductDetailModel? //published bir çeşit reaktif programlama keyword'düdür. kendisini dinleyen noktalara değiştiği zaman anlık olarak haber verir. örneğin: bir ürünün fiyatı 10 liradır daha sora o ürünün fiyatı socet üzerinden güncelinirse published sayesinde bunu kontrol etmemize gerek kalmadan view üzerinde tekrar çizilir.
    func getProduct(productId : Int){
        Network.shared.getNetwork(url: "https://fakestoreapi.com/products/\(productId)") { [weak self ](response : (Result<ProductDetailModel,Error>)) in
            guard let self = self else {return}
            switch response {
            case .success(let products):
                // Dispatqueqe.main ile main threade aldık işlemi
                DispatchQueue.main.async {
                    self.product = products
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}

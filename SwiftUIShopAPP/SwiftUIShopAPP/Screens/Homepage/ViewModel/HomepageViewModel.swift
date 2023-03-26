//
//  HomepageViewModel.swift
//  SwiftUIShopAPP
//
//  Created by Elif Tum on 28.01.2023.
//

import Foundation


class HomepageViewModel : ObservableObject {
    @Published var products : [ProductDetailModel] = [ProductDetailModel]()
    
    func getAllList(){ // network classında shared singleton üzerinde getNetwork fonksiyonuna eriştik ve bütün ürünleri liste halinde çektiğimiz bir api isteği gönderdik.
        Network.shared.getNetwork(url: "https://fakestoreapi.com/products") { [weak self ](response : (Result<ProductListModel,Error>)) in
            guard let self = self else {return}
            switch response {
            case .success(let products):
                // Dispatqueqe.main ile main threade aldık işlemi
                DispatchQueue.main.async {
                    self.products = products ?? [ProductDetailModel]()
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    
}

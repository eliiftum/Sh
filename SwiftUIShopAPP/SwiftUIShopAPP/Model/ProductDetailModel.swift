//
//  ProductDetailModel.swift
//  SwiftUIShopAPP
//
//  Created by Elif Tum on 28.01.2023.
//

import Foundation


struct ProductDetailModel : Codable ,Hashable{
   
    
    let id : Int?
    let title : String?
    let price : Double?
    let description : String?
    let category : String?
    let image : String?
    let rating: Rating?
}

struct Rating : Codable,Hashable {
    let rate : Double?
    let count : Int?
}

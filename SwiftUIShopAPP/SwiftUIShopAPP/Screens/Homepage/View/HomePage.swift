//
//  ContentView.swift
//  SwiftUIShopAPP
//
//  Created by Elif Tum on 28.01.2023.
//

import SwiftUI
struct HomePage: View {
    @StateObject var viewmodel = HomepageViewModel()
    var selectedIndex : Int?
    var body: some View {
        ZStack {
            
            Color.orange.ignoresSafeArea()
            ScrollView {
                VStack {
                    ForEach(viewmodel.products,id: \.self) { product in
                        NavigationLink {
                            ProductDetailView(id: product.id ?? 0)
                        } label: {
                            ProductCell(product: product)
                            
                        }
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Elif Tüm Ö-Ticaret")
        .onAppear {
            viewmodel.getAllList()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}



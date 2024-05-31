//
//  BloqueItemsProducts.swift
//  FakeShop
//
//  Created by Jairo Laurente Celis on 27/04/24.
//

import SwiftUI

struct BloqueItemsProducts: View {
    @EnvironmentObject var viewModel: ShopModelView
    //var shopModel: ShopModel
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    @State private var searchItem = ""
    var body: some View {
        LazyVGrid(columns: columns,spacing: 15) {
            ForEach(viewModel.products, id: \.id){ items in
                NavigationLink{
                    ItemDetailView(shopModel: items)
                      
                }label: {
                    ItemCard(item: items)
                        
                }
            }
            
            .frame(width: 183,height: 250)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 1)
                
            )
            
            .background(.ultraThinMaterial)
            .cornerRadius(10)
        }
    }
}

#Preview {
    ScrollView{
        BloqueItemsProducts()
            .environmentObject(ShopModelView())
    }
}

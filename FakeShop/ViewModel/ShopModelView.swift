//
//  ShopModelView.swift
//  FakeShop
//
//  Created by Jairo Laurente Celis on 15/04/24.
//

import Foundation


class ShopModelView: ObservableObject{
    
    @Published var products: [ShopModel] = []
    @Published var carProducts: [ShopModel] = []
    @Published var totalPrice = 0
    
    private let service = NetworkAPI.shared
    
    init(){
       getListOfItem()
    }
    
    func getListOfItem(){
        service.getListOfProducts { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let product):
                    self?.products = product
                    //self?.carProducts = product
                case .failure(let error):
                    print("Debug: Error \(error.localizedDescription)")
                    
                }
            }
        }
    }
    
    // agregar items al carrito
    
    func addCar(item: ShopModel){
        carProducts.append(item)
    }
    
    // Eliminar items del carrito
    func deleteItemProduct(id: Int){
        carProducts.removeAll(where: {$0.id == id})
    }
    
}

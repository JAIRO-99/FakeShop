//
//  ShopModelView.swift
//  FakeShop
//
//  Created by Jairo Laurente Celis on 30/05/24.
//
import Foundation
import SwiftUI



class ShopModelView: ObservableObject{
    
    @Published var products: [ShopModel] = []
    
    @Published var carProducts: [ShopModel] = []
     var totalPrice = 0
    
    private let service = NetworkAPI.shared
    
    init(){
        getListOfItem()
        carProducts = decodeAllProducts()
    }
    
    func getListOfItem(){
        service.getListOfProducts { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let product):
                    self?.products = product
                case .failure(let error):
                    print("Debug: Error \(error.localizedDescription)")
                    
                }
            }
        }
    }
    
    // agregar items al carrito
    
    func addCar(item: ShopModel){
        if !carProducts.contains(where: { model in
            model.id == item.id
        }){
            carProducts.append(item)
        }
        encodeAndSaveEventos()
    }
    
    // Eliminar items del carrito
    func deleteItemProduct(id: ShopModel){
        carProducts.removeAll(where: {$0.id == id.id})
        encodeAndSaveEventos()
    }
    
    func isFavoriteItem(favorite: Binding<ShopModel>){
      //  favorite.wrappedValue.isFavorite = !favorite.wrappedValue.isFavorite
    }
    
    func encodeAndSaveEventos(){
        if let encoded = try? JSONEncoder().encode(carProducts){
            UserDefaults.standard.set(encoded, forKey: "product")
        }
    }
    
    func decodeAllProducts() -> [ShopModel]{
        if let data = UserDefaults.standard.object(forKey: "product") as? Data{
            if let product = try? JSONDecoder().decode([ShopModel].self, from: data){
                return product
            }
        }
        return []
    }
}

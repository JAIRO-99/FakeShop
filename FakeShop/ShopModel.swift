//
//  ShopModel.swift
//  FakeShop
//
//  Created by Jairo Laurente Celis on 15/04/24.
//

import Foundation


struct ShopModel: Codable, Identifiable{
    
    let id: Int
    let title: String
    var price: Double
    let description: String?
    let category: String
    let image: String
    let rating: Rating
    //let descripción: String?
    
    static let example = ShopModel(id: 1, title: "Fjallraven - Mochila Foldsack No. 1, con capacidad para 15 portátiles", price: 109.95, description: "Tu mochila perfecta para el uso diario y los paseos por el bosque. tu portátil (hasta 15 pulgadas) en la funda acolchada, tu día a día", category: "ropa de hombre", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 3.9, count: 120))
}

struct Rating: Codable{
    let rate: Double
    let count: Int
}

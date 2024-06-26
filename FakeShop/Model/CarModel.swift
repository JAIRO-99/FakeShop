//
//  CarModel.swift
//  FakeShop
//
//  Created by Jairo Laurente Celis on 24/04/24.
//

import Foundation


// No sé si utilizar este MODEL para obtener datos de la API.
// Si eso se tendría que hacer, faltaría la func que llame a los datos en el file "Network API"

struct CarModel: Codable, Identifiable{
    
    let id: Int
    let title: String
    var price: Double
    let category: String
    let image: String
   
    //let descripción: String?
    
    static let example2 = CarModel(id: 1, title: "Fjallraven - Mochila Foldsack No. 1, con capacidad para 15 portátiles", price: 109.95, category: "ropa de hombre", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg")
}



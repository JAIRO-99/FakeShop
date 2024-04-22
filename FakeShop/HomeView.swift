//
//  HomeView.swift
//  FakeShop
//
//  Created by Jairo Laurente Celis on 16/04/24.
//

import SwiftUI

struct HomeView: View {
    
   // @StateObject var viewModel = ShopModelView()
    
    var body: some View {
        ZStack{
            Color(red: 0.5, green: 1.5, blue: 0.9)
                .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Hola")
                }
        }
    }
}

#Preview {
    HomeView()
}

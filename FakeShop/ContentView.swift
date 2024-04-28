//
//  ContentView.swift
//  FakeShop
//
//  Created by Jairo Laurente Celis on 15/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ShopModelView()
    let tabIcons = ["house","star","cart","person"]
    @State var indexSelectedIcons = 0
    
    
    var body: some View {
       
        NavigationStack {
            VStack {
                ZStack{
                    switch indexSelectedIcons {
                        case 0:
                        NavigationView{
                            PrincipalView()
                               // .environmentObject(viewModel)
                        }
                        
                        case 1:
                        NavigationView{
                            Text("2")
                        }
                        .navigationTitle("Favoritos")
                        case 2:
                        NavigationView{
                            CarView()
                               .environmentObject(viewModel)
                        }
                        .navigationTitle("Carrito de Compras")
                       
                    default:
                        NavigationView{
                            Text("5")
                        }
                        .navigationTitle("Usuario")
                        }
                    }
                Spacer()
                HStack{
                    ForEach(0..<4){ icon in
                        Spacer()
                        Button{
                            self.indexSelectedIcons = icon
                        }label: {
                            
                            if indexSelectedIcons == icon{
                                Image(systemName: tabIcons[icon])
                                    .frame(width: 60,height: 60)
                                    .background(.orange)
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)
                                    .padding(.horizontal)
                            }else{
                                Image(systemName: tabIcons[icon])
                                    .font(.title)
                                    .padding(.horizontal)
                                    .foregroundColor(.black)
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ShopModelView())
}

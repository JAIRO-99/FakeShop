//
//  ItemDetailView.swift
//  FakeShop
//
//  Created by Jairo Laurente Celis on 15/04/24.
//

import SwiftUI

struct ItemDetailView: View {
    
    @EnvironmentObject var viewModel: ShopModelView
    var shopModel: ShopModel
    
    @State private var counterItem = 1
    
    var itemPrice: String{
        if counterItem >= 1 {
            let task = Double(counterItem) * (shopModel.price)
            return String(task)
        }else{
            
        let realPrice = shopModel.price
            return String(realPrice)
        }
        
    }
    
    var body: some View {
    
        NavigationStack{
            ScrollView{
                ZStack {
                    Color(red: 108.0, green: 189.0, blue: 249.0)
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        VStack{
                            AsyncImage(url: URL(string: shopModel.image)){image in
                                image
                                    .resizable()
                                    .padding(.top)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 180, height: 180)
                            }placeholder: {
                                ProgressView()
                            }
                        }
                        .padding()
                        
                        Text("Categoria: \(shopModel.category)")
                            .padding(.top,50)
                            .bold()
                        Text(shopModel.description ?? "")
                            .padding()
                            
                        HStack{
                            Text("$\(itemPrice)")
                                .fontWeight(.bold)
                         
                            Spacer()
                            
                            HStack{
                                Spacer()
                                Stepper("\(counterItem)", value: $counterItem, in: 1...5)
                                    .frame(width: 120)
                            }
                        }
                        .padding(.horizontal,50)
                        .padding()
                        HStack{
                            
                            Text("Agregar al carrito")
                                .font(.custom("PlayfairDisplay-Bold", size: 20))
                               
                            
                        Button{
                          // viewModel.addCar(item: shopModel)
                                
                        }label: {
                            Image(systemName: "cart")
                                .font(.title2)
                                .padding()
                                .buttonStyle(.bordered)
                                .frame(width:40, height: 40)
                                .background(.white)
                                .clipShape(Capsule())
                                .foregroundColor(.orange)
                                .font(.title)
                        }
                        .padding()
                    }
                        .padding(.vertical,5)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity,alignment: .bottom)
                        .background(.orange)
                        .cornerRadius(50, corners: .topLeft)
                        .cornerRadius(50, corners: .bottomLeft)
                        
                    }
                
                }
            }
            .navigationTitle(shopModel.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ItemDetailView(shopModel: ShopModel.example)
        .environmentObject(ShopModelView())
}


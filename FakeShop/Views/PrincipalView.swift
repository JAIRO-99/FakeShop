//
//  PrincipalView.swift
//  FakeShop
//
//  Created by Jairo Laurente Celis on 16/04/24.
//

import SwiftUI

struct PrincipalView: View {
    
    //var shopModel: ShopModel
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    @State private var searchItem = ""
    
    var body: some View {
        NavigationStack{
            ZStack     {
                Color(red: 0.2, green: 0.2, blue: 0.2)
                    .edgesIgnoringSafeArea(.all)
                
            ScrollView  {
                    
                    VStack(alignment: .leading) {
                       
                        HStack{
                            Button{
                                
                            }label:{
                                Image(systemName: "slider.horizontal.3")
                                    .foregroundColor(.orange)
                                    .font(.title)
                            }
                            Spacer()
                            
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40,height: 40)
                                .cornerRadius(10)
                                .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.orange, lineWidth: 1)
                                )
                        }
                        .padding()
                        VStack(alignment: .leading){
                            Text("Encuentra lo mejor \nen")
                                .font(.custom("PlayfairDisplay-Regular", size: 28))
                                .foregroundColor(.orange)
                            
                            + Text(" Moda!")
                                .font(.custom("PlayfairDisplay-Bold", size: 28))
                                .foregroundColor(.orange)
                        }
                        .foregroundColor(.brown)
                        
                        //VISTA DE ITEMS
                        BloqueItemsProducts()
                    }
                    .padding()
                }
            }
            .navigationTitle("Gracce's Shop")
            //.searchable(text: $searchItem)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    PrincipalView()
}

struct BloqueItemsProducts: View {
    @ObservedObject var viewModel = ShopModelView()
    //var shopModel: ShopModel
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    @State private var searchItem = ""
    var body: some View {
        LazyVGrid(columns: columns,spacing: 15) {
            ForEach(viewModel.products, id: \.id){ items in
                NavigationLink{
                    ItemDetailView(shopModel: items)
                }label: {
                    ZStack {
                        VStack{
                            AsyncImage(url: URL(string: items.image)){image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(maxHeight: .infinity)
                                    .background(.white)
                            }placeholder: {
                                ProgressView()
                            }
                            
                            VStack{
                                Text(items.title)
                                    .font(.headline)
                                    .padding(.horizontal)
                                    .foregroundColor(.white)
                                
                                HStack{
                                    Text("$\(items.price, specifier: "%.2f")")
                                        .font(.headline)
                                        .padding()
                                        .background(.gray)
                                        .cornerRadius(10, corners: .bottomLeft)
                                        .cornerRadius(10, corners: .topRight)
                                        .foregroundColor(.white)
                                        .bold()
                                    
                                    Spacer()
                                    
                                    Button{
                                        viewModel.addCar(item: items)
                                        print("add car")
                                    }label: {
                                        Image(systemName: "cart")
                                            .resizable()
                                            .frame(width: 15,height: 15)
                                            .padding(15)
                                            .background(.orange)
                                            .clipShape(Capsule())
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                }
                                .padding()
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                        
                        
                    }
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

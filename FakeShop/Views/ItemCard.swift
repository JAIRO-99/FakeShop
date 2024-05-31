//
//  ItemCard.swift
//  FakeShop
//
//  Created by Jairo Laurente Celis on 27/04/24.
//
import SwiftData
import SwiftUI

struct ItemCard: View {
    @EnvironmentObject var viewModel: ShopModelView
   var item: ShopModel
    var body: some View {
        ZStack {
            VStack{
                AsyncImage(url: URL(string: item.image)){image in
                    image
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity)
                        .background(.white)
                }placeholder: {
                    ProgressView()
                        .frame(width: 100,height: 100)
                }
                
                VStack{
                    Text(item.title)
                        .font(.headline)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                    
                    HStack{
                        Text("$\(item.price, specifier: "%.2f")")
                            .font(.headline)
                            .padding()
                            .background(.gray)
                            .cornerRadius(10, corners: .bottomLeft)
                            .cornerRadius(10, corners: .topRight)
                            .foregroundColor(.white)
                            .bold()
                        
                        Spacer()
                        
                        Button{
                            
                            viewModel.addCar(item: item)
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
    ItemCard(item: ShopModel.example)
        .environmentObject(ShopModelView())
}

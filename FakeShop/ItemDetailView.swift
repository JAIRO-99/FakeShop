//
//  ItemDetailView.swift
//  FakeShop
//
//  Created by Jairo Laurente Celis on 15/04/24.
//

import SwiftUI

struct ItemDetailView: View {
    
    @StateObject var viewModel = ShopModelView()
    var shopModel: ShopModel
    
    @State private var counterItem = 1.0
    
    var itemPrice: String{
        if counterItem >= 1 {
            let task = counterItem * (shopModel.price)
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
                                Button{
                                counterItem -= 1
                                }label: {
                                Image(systemName: "minus.circle.fill")
                                }
                                
                                Text("\(counterItem, specifier: "%.0f")")
                                    .fontWeight(.medium)
                                
                                Button{
                                    counterItem += 1
                                }label: {
                                Image(systemName: "plus.circle.fill")
                                }
                            }
                        }
                        .padding(.horizontal,50)
                        .padding()
                        HStack{
                            
                            Text("Agregar al carrito")
                               
                        Button{
                            viewModel.addCar(item: shopModel)
                        }label: {
                            Image(systemName: "cart")
                                .font(.title2)
                                .buttonStyle(.bordered)
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
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

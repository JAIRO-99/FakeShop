//
//  CarView.swift
//  FakeShop
//
//  Created by Jairo Laurente Celis on 16/04/24.
//
import SwiftData
import SwiftUI

struct CarView: View {
    
   // @State var viewModel: ShopModelView
    @EnvironmentObject var viewModel: ShopModelView
    var body: some View {
        if viewModel.carProducts.count > 0 {
            List{
                ForEach(viewModel.carProducts,id: \.id){items in
                    HStack{
                        AsyncImage(url: URL(string: items.image)){image in
                            image
                                .resizable()
                                .frame(width: 60, height: 60)
                                .padding(.horizontal)
                        }placeholder: {
                            ProgressView()
                        }
                        VStack(alignment:.leading){
                            Text(items.title)
                                .font(.headline)
                            
                            Text("$\(items.price, specifier: "%.2f")")
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "trash")
                            .font(.headline)
                            .foregroundColor(.red)
                            .onTapGesture {
                                viewModel.deleteItemProduct(id: items)
                            }
                    
                        
                    }
                }
            }
        }else{
            Text("Your car is empty")
                .fontWeight(.medium)
                .padding()
                .frame(width: 200)
                .background(.orange)
                .cornerRadius(10, corners: .bottomRight)
                .cornerRadius(10, corners: .topLeft)
        }
    }
}

#Preview {
    CarView()
        .environmentObject(ShopModelView())
      
}

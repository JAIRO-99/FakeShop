//
//  PrincipalView.swift
//  FakeShop
//
//  Created by Jairo Laurente Celis on 16/04/24.
//

import SwiftUI

struct PrincipalView: View {
    
    @EnvironmentObject var viewModel: ShopModelView
    
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
                            .environmentObject(ShopModelView())
                    }
                    .padding()
                }
            }
            .navigationTitle("Gracce's Shop")
           // .searchable(text: $searchItem, prompt: "Buscar producto")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    PrincipalView()
        .environmentObject(ShopModelView())
}

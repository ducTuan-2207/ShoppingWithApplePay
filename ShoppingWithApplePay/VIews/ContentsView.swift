//
//  ContentsView.swift
//  ShoppingWithApplePay
//
//  Created by macOS on 27/03/2024.
//

import SwiftUI

struct ContentsView: View {
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    @StateObject var cartManager = CartManager() // Di chuyển @StateObject vào đây
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20){
                        ForEach(ProductList, id: \.id){ product in
                            ProductCard(product: product)
                                .environmentObject(cartManager)
                        }
                }
                .navigationTitle(Text("DucTuan Shop"))
                .toolbar {
                    NavigationLink {
                        CartView()
                            .environmentObject(cartManager) // Truyền cùng một thể hiện của CartManager
                    } label: {
                        CardButton(numberOfProduct: cartManager.products.count)
                    }
                    
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}


struct ContentsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentsView()
    }
}

//
//  ProductCard.swift
//  ShoppingWithApplePay
//
//  Created by macOS on 26/03/2024.
//

import SwiftUI

struct ProductCard: View {
    var product: Product
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(product.image)
                .resizable()
                .cornerRadius(20)
                .frame(width: 180)
                .scaledToFit()
            VStack(alignment: .leading){
                Text(product.name)
            }
            
        }
        .frame(width: 180, height: 250)
        .shadow(radius: 3)
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: ProductList[0])
    }
}

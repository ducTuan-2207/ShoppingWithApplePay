//
//  ProductRow.swift
//  ShoppingWithApplePay
//
//  Created by macOS on 27/03/2024.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    var body: some View {
        HStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit) // cho phép view tự động điều chỉnh để hiển thị nội dung một cách đầy đủ và không làm thay đổi tỷ lệ khung hình
                .frame(width: 50)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name).bold()
                Text("$\(product.price)")
            }
            Spacer()
            Image(systemName: "trash")
                .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: ProductList[1])
            .environmentObject(CartManager())
    }
}

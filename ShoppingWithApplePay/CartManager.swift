//
//  CartManager.swift
//  ShoppingWithApplePay
//
//  Created by macOS on 27/03/2024.
//

import Foundation

//ObservableObject để những thay đổi trong lớp này sẽ được cập nhật ngay lập tức trong giao diện người dùng
class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    // them san pham vao gio hang
    func addToCart(product: Product, quantity: Int = 1) {
        for _ in 0..<quantity {
            products.append(product)
        }
        total += product.price * quantity // Tính tổng giá bằng số lượng nhân đơn giá
    }

    
    // xoa san pham ra khoi gio hang
    func removeFromCart(product: Product){
        products = products.filter {
            $0.id != product.id
        }
        total -= product.price * products.filter { $0.id == product.id }.count // Giảm tổng giá bằng cách trừ giá của sản phẩm đã bị xóa
    }
}

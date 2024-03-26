//
//  Products.swift
//  ShoppingWithApplePay
//
//  Created by macOS on 26/03/2024.
//

import Foundation

struct Product : Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}
var ProductList = [Product(name: "Áo 1", image: "sw1", price: 100),
                   Product(name: "Áo 2", image: "sw2", price: 200),
                   Product(name: "Áo 3", image: "sw3", price: 300),
                   Product(name: "Áo 4", image: "sw4", price: 400),
                   Product(name: "Áo 5", image: "sw5", price: 500),
                   Product(name: "Áo 6", image: "sw6", price: 600),
                   Product(name: "Áo 7", image: "sw7", price: 700),
                   Product(name: "Áo 8", image: "sw8", price: 800),]

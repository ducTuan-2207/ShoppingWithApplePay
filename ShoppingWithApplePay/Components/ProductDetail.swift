//
//  ProductDetail.swift
//  ShoppingWithApplePay
//
//  Created by macOS on 27/03/2024.
//

import SwiftUI

struct ProductDetail: View {
    var product: Product
    @State private var selectedSize: String?
    @State private var quantity: Int = 1
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20){
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180, height: 250)
                    .scaledToFit()
                    .shadow(radius: 3)
                
                Text(product.name)
                    .bold()
                    .font(Font.custom("Helvetica", size: 30))
                
                Text(product.description)
                    .font(.system(size: 20))
                
                Text("$\(product.price)")
                    .font(.title).bold()
                    .foregroundColor(.red)
                
                Text("Kích thước")
                    .font(.title2).bold()
                
                HStack(spacing: 10) {
                    ForEach(product.sizes, id: \.self) { size in
                        Button {
                            if selectedSize == size {
                                selectedSize = nil
                            } else {
                                selectedSize = size
                            }
                        } label: {
                            Text(size)
                                .fontWeight(.bold)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(selectedSize == size ? Color.red : Color.clear)
                                .foregroundColor(selectedSize == size ? .white : .black)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                }

                Stepper("Số lượng : \(quantity)", value: $quantity, in: 1...10)
                    .font(.title2).bold()
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "cart")
                        Text("Thêm vào giỏ hàng")
                                
                    }
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10) 
                }
                
            }
            .padding()
        }
    }
}

struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetail(product: ProductList[0])
    }
}

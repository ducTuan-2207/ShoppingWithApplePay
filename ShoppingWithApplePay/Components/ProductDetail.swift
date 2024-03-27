//
//  ProductDetail.swift
//  ShoppingWithApplePay
//
//  Created by macOS on 27/03/2024.
//

import SwiftUI

struct ProductDetail: View {
    var product: Product
    @EnvironmentObject var cartManager: CartManager
    @State private var selectedSize: String?
    @State private var quantity: Int = 1
    @State private var isShowingConfirmation = false
    
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
                
                Stepper("Số lượng : \(quantity)", value: Binding<Int>(
                    get: { self.quantity },
                    set: { newValue in
                        self.quantity = newValue
                        isShowingConfirmation = false // Đảm bảo là hộp thoại xác nhận không được hiển thị khi số lượng sản phẩm thay đổi
                    }
                ), in: 1...10)
                .font(.title2).bold()

                Button {
                    cartManager.addToCart(product: product)
                    isShowingConfirmation = true
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
            .alert(isPresented: $isShowingConfirmation) {
                Alert(
                    title: Text("Thêm vào giỏ hàng thành công"),
                    message: Text("Sản phẩm đã được thêm vào giỏ hàng."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    
    struct ProductDetail_Previews: PreviewProvider {
        static var previews: some View {
            ProductDetail(product: ProductList[0])
                .environmentObject(CartManager())
        }
    }
}

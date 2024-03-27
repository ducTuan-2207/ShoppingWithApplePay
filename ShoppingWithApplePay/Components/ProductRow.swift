import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        HStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(product.name).bold()
                    Spacer()
                    let productCount = cartManager.products.filter { $0.id == product.id }.count
                    Text("\(productCount) sản phẩm")

                }
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
        .id(UUID()) // This forces the view to reload when cartManager.products changes
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: ProductList[1])
            .environmentObject(CartManager())
    }
}

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        ProductDetail(product: product)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Truyền vào một sản phẩm và CartManager cho xem trước
        ProductDetailView(product: ProductList[0])
            .environmentObject(CartManager())
    }
}

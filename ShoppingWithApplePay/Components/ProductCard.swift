import SwiftUI

struct ProductCard: View {
    var product: Product
    @EnvironmentObject var cartManager: CartManager
    @State private var isShowingDetail = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                    .onTapGesture {
                        isShowingDetail.toggle()
                    }
                VStack(alignment: .leading){
                    Text(product.name)
                        .bold()
                    Text("\(product.price)$")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(Color.white.opacity(0.5)) // Đóng dấu ngoặc đơn ở đây
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
            Button {
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(50)
                    .padding()
            }
        }
        .sheet(isPresented: $isShowingDetail) {
            ProductDetailView(product: product) // Truyền closure chứa ProductDetailView
        }
    }
}


struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        // Đảm bảo rằng CartManager được truyền vào là một environment object
        ProductCard(product: ProductList[0])
            .environmentObject(CartManager())
    }
}

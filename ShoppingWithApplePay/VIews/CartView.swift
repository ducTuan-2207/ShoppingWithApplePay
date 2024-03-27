import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        HStack {
            ScrollView {
                if cartManager.products.count > 0 {
                    ForEach(cartManager.products, id: \.id){ product in
                        ProductRow(product: product)
                    }
                    HStack {
                        Text("Your cart total is")
                        Spacer()
                        Text("$\(cartManager.total)")
                            .bold()
                            .foregroundColor(.red)
                            .font(.title2)
                    }
                    .padding()
                } else {
                    Text("Your cart is empty!")
                }
                
               
            }
            .navigationTitle(Text("My cart"))
        .padding(.top)
        }
        Button {
            
        } label: {
            HStack {
                Image(systemName: "creditcard.circle")
                Text("Thanh toán")
                
                
            }
            .fontWeight(.bold)
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
            .frame(width: 250)
        }
    }
    
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager()) // Truyền một thể hiện của CartManager là một environment object
    }
}

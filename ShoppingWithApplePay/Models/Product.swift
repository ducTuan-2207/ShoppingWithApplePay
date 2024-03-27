import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
    var description: String
    var sizes: [String] 
}

var ProductList = [
    Product(name: "Áo 1", image: "sw1", price: 100, description: "Mẫu áo thứ 1 này sẽ đem lại cho bạn sự tự tin và sành điệu, xu hướng dành cho những tín đồ thời trang", sizes: ["S", "M", "L", "XL"]),
    Product(name: "Áo 2", image: "sw2", price: 200, description: "Mẫu áo thứ 2 này sẽ đem lại cho bạn sự tự tin và sành điệu, xu hướng dành cho những tín đồ thời trang", sizes: ["S", "M", "L"]),
    Product(name: "Áo 3", image: "sw3", price: 300, description: "Mẫu áo thứ 3 này sẽ đem lại cho bạn sự tự tin và sành điệu, xu hướng dành cho những tín đồ thời trang", sizes: ["M", "L", "XL"]),
    Product(name: "Áo 4", image: "sw4", price: 400, description: "Mẫu áo thứ 4 này sẽ đem lại cho bạn sự tự tin và sành điệu, xu hướng dành cho những tín đồ thời trang", sizes: ["S", "L", "XL"]),
    Product(name: "Áo 5", image: "sw5", price: 500, description: "Mẫu áo thứ 5 này sẽ đem lại cho bạn sự tự tin và sành điệu, xu hướng dành cho những tín đồ thời trang", sizes: ["S", "M", "XL"]),
    Product(name: "Áo 6", image: "sw6", price: 600, description: "Mẫu áo thứ 6 này sẽ đem lại cho bạn sự tự tin và sành điệu, xu hướng dành cho những tín đồ thời trang", sizes: ["S", "M", "L"]),
    Product(name: "Áo 7", image: "sw7", price: 700, description: "Mẫu áo thứ 7 này sẽ đem lại cho bạn sự tự tin và sành điệu, xu hướng dành cho những tín đồ thời trang", sizes: ["M", "L", "XL"]),
    Product(name: "Áo 8", image: "sw8", price: 800, description: "Mẫu áo thứ 8 này sẽ đem lại cho bạn sự tự tin và sành điệu, xu hướng dành cho những tín đồ thời trang", sizes: ["S", "XL"]),
]

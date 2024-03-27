//
//  CardButton.swift
//  ShoppingWithApplePay
//
//  Created by macOS on 27/03/2024.
//

import SwiftUI

struct CardButton: View {
    var numberOfProduct: Int
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName:"cart")
                .padding(.top, 5)
            if numberOfProduct > 0 {
                Text("\(numberOfProduct)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15,height: 15)
                    .background(Color(hue: 1.0, saturation: 0.707, brightness: 0.831))
                    .cornerRadius(50)
            }
        }
        
    }
}

struct CardButton_Previews: PreviewProvider {
    static var previews: some View {
        CardButton(numberOfProduct: 1)
    }
}


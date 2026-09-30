//
//  OrderPromocode.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 08/09/26.
//

import SwiftUI

struct OrderPromocode: View {
   //MARK: - PROPERTIES
   
   let price: String
   @Binding var isDiscount: Bool
   //MARK: - BODY

    var body: some View {
       VStack(alignment: .leading) {
          Text("Promokod")
             .padding(.top)
             .padding(.leading)
          
          HStack(alignment: .top) {
             VStack(alignment: .leading)  {
                Text("Bonus ballar uchun")
                Text("\(price) UZS chegirma")
                Text("\(price) OqCoin ta \(price)")
                   .font(.caption)
                   .foregroundStyle(.secondary)
                Text("bonus ballardan ishlatiladi")
                   .foregroundStyle(.secondary)
                   .font(.caption)
             } //: VSTACK
             .fixedSize(horizontal: true, vertical: false)
             
             Spacer()
             Toggle("", isOn: $isDiscount)
          } //: HSTACK
          .padding()
          .background(.purple.opacity(0.1))
       } //: VSTACK
    }
}

#Preview {
   OrderPromocode(price: "1730,57", isDiscount: .constant(false))
      .padding()
}


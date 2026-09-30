//
//  OrderPirceinfo.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 08/09/26.
//

import SwiftUI

struct OrderPirceinfo: View {
   let price: Double
   @Binding var isBonus: Bool
   @Binding var bonus: Double
   private var extraBonus: Double {
      totalSum * 0.02
   }
   
   private var totalSum: Double {
      if isBonus {
         price - bonus
      } else {
         price
      }
   }
    var body: some View {
       VStack(spacing: 16) {
          HStack {
             VStack(alignment: .leading) {
                Text("Buyurtmadagi maxsulotlar")
                Text("3 dona")
                   .foregroundStyle(.secondary)
                   .font(.caption)
             } //: VSTACK
             Spacer()
             
             Text("\(String(format: "%.2f", price)) UZS")
          } //: HSTACK
          
          Divider()
          
          if isBonus {
             HStack(spacing: 5) {
                Text("Ballar bilan to'langan")
                
                Spacer()
                
                Text("-\(String(format: "%.2f", bonus))")
                   .foregroundStyle(.green)
                LogoCoin()
                   .foregroundStyle(.green)
             } //: HSTACK
             Divider()
          }
          
          HStack(spacing: 5) {
             Text("Hisoplanadigan bonuslar")
             
             Spacer()
             
             Text("\(String(format: "%.2f", extraBonus)) UZS")
             LogoCoin()
          } //: HSTACK
          
          Divider()
          
          HStack {
             Text("Jami")
             
             Spacer()
             
             Text("\(String(format: "%.2f", totalSum)) UZS")
          } //: HSTACK
          
       } //: VSTACK
       .padding()
       .modifier(OrderCartBackgroundModifier())
    }
}

#Preview {
   @Previewable @State var isBonus: Bool = false
   @Previewable @State var bonus: Double = 1000
   OrderPirceinfo(price: 50000, isBonus: $isBonus, bonus: $bonus)
}

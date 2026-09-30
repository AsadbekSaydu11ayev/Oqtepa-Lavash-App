//
//  OrderExtraItem.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 08/09/26.
//

import SwiftUI

struct OrderExtraItem: View {
   //MARK: - PROPERTIES
   let image: String
   let text: String
   var summa: String?
   var isFree: String?
   
   @State var itemCount: Int = 1
   @State var maxLimitCount: Int = 5
   @State var minLimitCount: Int = 1
   //MARK: - BODYO

    var body: some View {
       HStack {
          Image(image)
             .renderingMode(.template)
             .resizable()
             .scaledToFit()
             .foregroundStyle(Color.primary)
             .frame(width: 30, height: 30)
          
          VStack(alignment: .leading) {
             HStack {
                Text(text)
                   
                if let summa {
                   Text("\(summa) UZS")
                      .foregroundStyle(.secondary)
                }
             }
             
             if let isFree {
                Text(isFree)
                   .font(.caption)
                   .foregroundStyle(.secondary)
             }
          } //: VSTACK
          
          Spacer()
          
          VStack(alignment: .trailing) {
             HStack {
                if itemCount > minLimitCount {
                   Button {
                      if itemCount > 0 {
                         itemCount -= 1
                      }
                   } label: {
                      Image(systemName: "minus")
                         .foregroundStyle(.white)
                         .frame(width: 25, height: 25)
                         .background(.black, in: .rect(cornerRadius: 8))
                         .shadow(color: Color.primary, radius: 5)
                   } //: MINUS BUTTON
                }
                
                Text("\(itemCount)")
                   .frame(minWidth: 16)
                
                Button {
                   if itemCount < maxLimitCount {
                      itemCount += 1
                   }
                } label: {
                   Image(systemName: "plus")
                      .foregroundStyle(.white)
                      .frame(width: 25, height: 25)
                      .background(.black, in: .rect(cornerRadius: 8))
                      .shadow(color: Color.primary, radius: 5)
                } //: PLUS BUTTON
             } //: HSTACK
          } //: VSTACK
       } //: HSTACK
    }
}

#Preview {
   OrderExtraItem(image: "paper-bag", text: "Dastavka uchun nabor", isFree: "bepul", minLimitCount: 0)
      .padding()
   OrderExtraItem(image: "paper-bag-2", text: "Paket", summa: "1000", maxLimitCount: 1, minLimitCount: 1)
      .padding()
}

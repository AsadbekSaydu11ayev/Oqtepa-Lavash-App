//
//  OrderExtraItem.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 08/09/26.
//

import SwiftUI

struct OrderExtraFood: View {
    var body: some View {
       ScrollView(.horizontal, showsIndicators: false) {
          HStack {
             ForEach(0...10, id: \.self) { index in
                VStack {
                   Image("tandir-lavash")
                      .resizable()
                      .scaledToFit()
                      .frame(width: 50, height: 50)
                   Spacer()
                   
                   Text("Klab sendvich")
                      .foregroundStyle(Color.primary)
                      .font(.caption)
                      .fixedSize(horizontal: false, vertical: true)
                   Spacer()
                   
                   Text("42000 UZS")
                      .font(.caption.weight(.bold))
                      .fixedSize(horizontal: false, vertical: true)
                } //: VSTACK
                .padding(10)
                .frame(width: 110, height: 150)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 12))
             }
          } //: HSTACK
       } //: SCROLL
    }
}

#Preview {
    OrderExtraFood()
      .padding()
}

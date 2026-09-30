//
//  CoinsCashbackCard.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 13/08/26.
//

import SwiftUI

struct CoinsCashbackCard: View {
    var body: some View {
       VStack {
          HStack {
             Text("Cashback 2%")
                .fontWeight(.bold)
             
             Image(systemName: "info.circle")
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(.white)
             
             Spacer()
             
             Text("1471.2")
                .fontWeight(.bold)
          } //: HSTACK
          .foregroundStyle(.white)
          
          HStack {
             Text("Sizning")
             Spacer()
             Text("OqCoin")
          } //: HSTACK
          .foregroundStyle(Color.black)
          .font(.caption)
          
          HStack {
             Text("Cashback")
             Spacer()
             Text("1 OqCoin = 1 UZS")
          } //: HSTACK
          .foregroundStyle(Color.black)
          .font(.caption)
          
          HStack {
             Text("Darajangiz")
             Spacer()
             Text("")
          } //: HSTACK
          .foregroundStyle(.black)
          .font(.caption)
          
          Spacer()
       } //: VSTACK
       .padding()
       .frame(height: 160)
       .background(
         cashbackCardBackground
       )
       .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    CoinsCashbackCard()
      .padding()
}

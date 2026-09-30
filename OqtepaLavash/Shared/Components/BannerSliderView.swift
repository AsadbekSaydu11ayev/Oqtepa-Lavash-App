//
//  PromotionSliderView.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 07/08/26.
//

import SwiftUI

struct BannerSliderView: View {
   let images: [String]
   @State private var currPage: Int = 0
    var body: some View {
       TabView(selection: $currPage) {
          ForEach(0..<images.count, id: \.self) { index in
             Image(images[index])
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 16))
                .tag(index)
                .padding(.horizontal)
          }
       }
       .frame(height: 120)
       .clipShape(.rect(cornerRadius: 16))
       .tabViewStyle(.page(indexDisplayMode: .never))
       .overlay (alignment: .bottom) {
          HStack {
             ForEach(0..<images.count, id: \.self) { index in
                Capsule()
                   .fill(.tertiary)
                   .frame(
                     width: currPage == index ? 25 : 10,
                     height: 10
                   )
                   .animation(.easeOut, value: currPage)
             } //: LOOP
          } //: HSTACK
          .offset(y: 16)
       }
       
    }
}

#Preview {
   BannerSliderView(images: ["banner-shaurma", "banner-chegirma", "banner-chegirma", "banner-chegirma", "banner-chegirma", "banner-chegirma", "banner-chegirma", "banner-chegirma"])
}

//
//  CoinsTitleCard.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 13/08/26.
//

import SwiftUI

struct CoinsTitleCard: View {
   var image: String?
   
    var body: some View {
       HStack(spacing: 16) {
          ZStack {
             if let image {
                Image(image)
                   .resizable()
                   .scaledToFit()
             } else {
                Image(systemName: "person.fill")
                   .resizable()
                   .scaledToFit()
                   .foregroundStyle(.gray)
                   .frame(width: 30, height: 30)
             }
          } //: ZSTACK
          .frame(width: 80, height: 80)
          .background(.white)
          .clipShape(.rect(cornerRadius: 10))
          .overlay {
             RoundedRectangle(cornerRadius: 10)
                .stroke(Color.primary, lineWidth: 1)
          }
          
          VStack(alignment: .leading) {
             HStack {
                Text("+998 (94) 681-81-42")
                   .foregroundStyle(Color.primary)
                   .fontWeight(.bold)
                
                Spacer()
                
                Button {
                   
                } label: {
                   Image("pencil")
                      .renderingMode(.template)
                      .resizable()
                      .scaledToFit()
                      .foregroundStyle(Color.primary)
                      .frame(width: 15)
                }
             } //: HSTACK
             
             Text("Profilingizni toldiring, buyurtmani tezroq rasmiylashtiring")
                .foregroundStyle(Color.primary)
                .font(.caption)
          } //: VSTACK
       } //: HSTACK
       .padding()
       .background(Color(UIColor.secondarySystemBackground))
       .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    CoinsTitleCard()
}

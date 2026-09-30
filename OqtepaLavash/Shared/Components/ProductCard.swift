//
//  ProductCard.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 07/08/26.
//

import SwiftUI
import Kingfisher

struct ProductCard: View {
   let image: String?
   let title: String
   let price: String
   let description: String
   
   var body: some View {
      VStack(alignment: .leading) {
         HStack {
            if let imageStringURL = image?.formattedImageURL(), let imageURL = URL(string: imageStringURL) {
               KFImage(imageURL)
                  .placeholder {
                     ProgressView()
                        .scaleEffect(1.5)
                  }
                  .resizable()
                  .scaledToFit()
                  .frame(width: 140, height: 140)
            }
         } //: ZSTACK
         .frame(maxWidth: .infinity)
         Spacer()
         
         Text(title)
            .font(.caption.weight(.bold))
            .foregroundStyle(Color.primary)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.leading)
            .layoutPriority(1)
         
         Text(description)
            .foregroundStyle(.secondary)
            .font(.caption2)
            .multilineTextAlignment(.leading)
            .lineLimit(3)
         Spacer()
         
         Text("\(price) UZS")
            .padding(8)
            .font(.caption.weight(.bold))
            .foregroundStyle(.productMoney)
            .fixedSize(horizontal: false, vertical: true)
            .background(.productMoneyBackground)
            .clipShape(.rect(cornerRadius: 8))
            .overlay {
               RoundedRectangle(cornerRadius: 8)
                  .stroke(.secondary, lineWidth: 0.7)
            }
      } //: VSTACK
      .padding()
      .frame(maxWidth: 250)
      .frame(maxHeight: 380)
      .background(.product)
      .clipShape(.rect(cornerRadius: 16))
      .shadow(color: .secondary, radius: 5)
      .overlay {
         RoundedRectangle(cornerRadius: 16)
            .stroke(.secondary, lineWidth: 1)
      }
//      .padding(.horizontal, 16)
   }
}

#Preview {
   ProductCard(image: "http://localhost:4000/uploads/5a1a0f80-d2bc-4598-9d6f-6f70ab0f27bc.png", title: "Kartoshka fri katta dueti", price: "40000", description: "Yupqa lavash non, pomidor, chips, mol go'shti, qizil sous, mayonez")
}

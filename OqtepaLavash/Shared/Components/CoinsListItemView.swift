//
//  CoinsListItem.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 13/08/26.
//

import SwiftUI

struct CoinsListItemView: View {
   let name: String
   let imageName: String
   
    var body: some View {
       HStack {
          Text(name)
          Spacer()
          Image(systemName: imageName)
       }
    }
}

#Preview {
   CoinsListItemView(name: "QR-kodni ko'rsatish", imageName: "qrcode")
      .padding()
}

//
//  LocationView.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 07/08/26.
//

import SwiftUI

struct LocationView: View {
   @State private var choosingLocation: Bool = true
    var body: some View {
       VStack {
          HStack {
             Button {
                choosingLocation = true
             } label: {
                Text("O'zi olib ketish")
                   .font(.caption.weight(.bold))
                   .foregroundStyle(Color.primary)
                   .frame(maxWidth: .infinity)
                   .frame(height: 50)
                   .background(choosingLocation ? .orange : .clear)
                   .clipShape(.rect(cornerRadius: 16))
             }
             
             Spacer()
             
             Button {
                choosingLocation = false
             } label: {
                Text("Yetkazib berish")
                   .font(.caption.weight(.bold))
                   .foregroundStyle(Color.primary)
                   .frame(maxWidth: .infinity)
                   .frame(height: 50)
                   .background(choosingLocation ? .clear : .orange)
                   .clipShape(.rect(cornerRadius: 16))
             }
          } //: HSTACK
          .padding(.horizontal, 5)
          .frame(height: 60)
          .background(.primaryBackground)
          .clipShape(.rect(cornerRadius: 16))
          
          Button {
             
          } label: {
             HStack {
                Image(systemName: "mappin.and.ellipse")
                
                Text("Farg'ona viloyati, Marg'ilon sh. Mustaqillik kochasi")
                   .font(.caption)
             } //: HSTACK
             .padding(.horizontal)
             .frame(maxWidth: .infinity)
             .frame(height: 60)
             .foregroundStyle(Color.primary)
             .lineLimit(1)
             .background(.primaryBackground)
             .clipShape(.rect(cornerRadius: 16))
          } //: BUTTON
       } //: VSTACK
    }
}

#Preview {
    LocationView()
}

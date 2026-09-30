//
//  ShareLinkButton.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 13/08/26.
//

import SwiftUI

struct ShareLinkButton: View {
    var body: some View {
       ShareLink(item: promocodeText) {
          VStack {
             HStack {
                Text("Promokodni ulashing")
                   .fontWeight(.bold)
                Spacer()
                Image(systemName: "link")
             } //: HSTACK
             .foregroundStyle(.white)
             
             HStack {
                Text("Do'stingizni taklif \nqiling - 5000 UZS oling!")
                   .foregroundStyle(.white.opacity(0.7))
                   .multilineTextAlignment(.leading)
                
                Spacer()
                
                HStack(spacing: 4) {
                   Image(systemName: "document.on.document.fill")
                      .font(.caption)
                   Text("HEMS")
                } //: HSTACK
                .padding(5)
                .foregroundStyle(.white)
                .background(.black, in: .rect(cornerRadius: 10))
             } //: HSTACK
             
          } //: VSTACK
          .padding()
       } //: SHARELINK
       .background(
         LinearGradient(colors: [.gray, .cyan.opacity(0.5)], startPoint: .leading, endPoint: .trailing)
       )
       .clipShape(.rect(cornerRadius: 16))
    }
}

#Preview {
    ShareLinkButton()
}

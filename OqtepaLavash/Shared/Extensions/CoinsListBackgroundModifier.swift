//
//  CoinsListBackgroundStyle.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 13/08/26.
//

import SwiftUI

struct CoinsListBackgroundModifier: ViewModifier {
   func body(content: Content) -> some View {
      content
         .padding()
         .foregroundStyle(Color.primary)
         .background(Color(UIColor.secondarySystemBackground))
         .clipShape(.rect(cornerRadius: 16))
   }
}

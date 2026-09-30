//
//  OrderCartBackgroundModifier.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 08/09/26.
//

import SwiftUI

struct OrderCartBackgroundModifier: ViewModifier {
   func body(content: Content) -> some View {
      content
         .background(Color(uiColor: .secondarySystemBackground))
         .clipShape(.rect(cornerRadius: 15))
   }
}


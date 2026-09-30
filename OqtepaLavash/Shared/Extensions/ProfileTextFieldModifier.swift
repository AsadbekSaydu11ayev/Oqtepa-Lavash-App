//
//  ProfileTextFieldModifier.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 09/09/26.
//

import SwiftUI

struct ProfileTextFieldModifier: ViewModifier {
   func body(content: Content) -> some View {
      content
         .padding(.horizontal)
         .frame(height: 50)
         .glassEffect()
         .shadow(color: Color.primary.opacity(0.5), radius: 5)
         .tint(.gray)
         .autocorrectionDisabled()
   }
}


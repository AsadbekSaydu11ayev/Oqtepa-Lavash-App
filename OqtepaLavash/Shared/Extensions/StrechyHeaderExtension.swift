//
//  StrechyHeader.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 08/08/26.
//

import SwiftUI

extension View {
   func strechyHeader() -> some View {
      visualEffect { effect, geo in
         let currHeight = geo.size.height
         let scrollOffset = geo.frame(in: .scrollView).minY
         
         let positiveOffset = max(0, scrollOffset)
         let newHeight = currHeight + positiveOffset
         let scaleFactor = newHeight / currHeight
         
         return effect
            .scaleEffect(scaleFactor, anchor: .bottom)
            .offset(y: scrollOffset > 0 ? -scrollOffset / 2 : 0)
      }
   }
}

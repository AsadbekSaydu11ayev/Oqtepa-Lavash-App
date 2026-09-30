//
//  ShimmeringExtension.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 9/19/26.
//

import SwiftUI

// 1. Shimmer effekti uchun ViewModifier
struct ShimmerModifier: ViewModifier {
   @State private var phase: CGFloat = 0
   
   func body(content: Content) -> some View {
      content
         .overlay(
            GeometryReader { geometry in
               LinearGradient(
                  gradient: Gradient(colors: [
                     Color.black.opacity(0.4),
                     Color.white.opacity(0.8),
                     Color.black.opacity(0.4)
                  ]),
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
               )
               .rotationEffect(.degrees(30))
               .offset(x: phase * geometry.size.width * 2.5 - geometry.size.width)
            }
         )
         .mask(content)
         .onAppear {
            withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
               phase = 1
            }
         }
   }
}

// 2. Har qanday View'da .shimmering() deb chaqira olish uchun Extension
extension View {
   @ViewBuilder
   func shimmering(active: Bool = true) -> some View {
      if active {
         self.modifier(ShimmerModifier())
      } else {
         self
      }
   }
}

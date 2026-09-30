//
//  ToastRootView.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 22/09/26.
//

import SwiftUI

struct ToastRootView<Content: View>: View {
   @ViewBuilder var content: Content
   
   @State private var activeToast: Toast?
   @State private var toastDismissWorkItem: DispatchWorkItem?
   
   // Drag-gesture paytida barmoqqa ergashishi uchun
   @State private var dragOffset: CGFloat = 0
   
   private let animation: Animation = .interpolatingSpring(duration: 0.35, bounce: 0, initialVelocity: 0)
   
   private func dismiss() {
      withAnimation(animation) {
         activeToast = nil
         dragOffset = 0
      }
      
      toastDismissWorkItem?.cancel()
   }
   
   @ViewBuilder
   private func ToastView(_ toast: Toast) -> some View {
      HStack(spacing: 12) {
         if let symbol = toast.symbol {
            Image(systemName: symbol)
               .font(.title3)
               .foregroundStyle(.primary)
               .transition(.identity)
         }
         
         Text(toast.title)
            .font(.subheadline)
            .fontWeight(.medium)
            .lineLimit(1)
         
         Spacer(minLength: 0)
         
         if let actionTitle = toast.actionTitle, let action = toast.action {
            Button {
               if action() {
                  dismiss()
               }
            } label: {
               Text(actionTitle)
                  .font(.subheadline)
                  .fontWeight(.semibold)
                  .foregroundStyle(toast.actionTint)
            }
            .transition(.identity)
         }
      }
      .padding(.horizontal, 16)
      .frame(height: 50)
      // iOS Material Glass Effekti (Xatosiz va chiroyli)
      .background(.ultraThinMaterial, in: Capsule())
      .overlay(
         Capsule()
            .stroke(Color.white.opacity(0.2), lineWidth: 1)
      )
      .shadow(color: .black.opacity(0.12), radius: 10, x: 0, y: 5)
      .padding(.horizontal, 15)
      // Barmoqqa ergashish surish effekti
      .offset(y: toast.placementOffset + dragOffset)
      .gesture(
         DragGesture()
            .onChanged { value in
               // Faqat pastga surishga ruxsat beramiz (agar bottom-da bo'lsa)
               if value.translation.height < 0 {
                  dragOffset = value.translation.height
               }
            }
            .onEnded { value in
               if value.translation.height < -30 {
                  dismiss()
               } else {
                  withAnimation(.spring) {
                     dragOffset = 0
                  }
               }
            }
      )
      .transition(.offset(y: toast.transitionOffset).combined(with: .opacity))
   }
   
   var body: some View {
      content
         .frame(maxWidth: .infinity, maxHeight: .infinity)
         .overlay(alignment: .top) {
            if let activeToast {
               ToastView(activeToast)
                  .padding(.bottom, 10)
            }
         }
         .environment(\.showToast) { toast in
            // Eski toast bo'lsa darhol yo'qotib yangisini chiqarish
            withAnimation(animation.logicallyComplete(after: 0.15), completionCriteria: .logicallyComplete) {
               if activeToast != nil {
                  activeToast = nil
               }
            } completion: {
               toastDismissWorkItem?.cancel()
               dragOffset = 0
               
               withAnimation(animation) {
                  activeToast = toast
               }
               
               // Haptic Feedback
               let generator = UIImpactFeedbackGenerator(style: .light)
               generator.impactOccurred()
               
               let duration = max(toast.duration, 1.5)
               toastDismissWorkItem = .init(block: dismiss)
               
               if let toastDismissWorkItem {
                  DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: toastDismissWorkItem)
               }
            }
         }
         .environment(\.dismissToast) {
            dismiss()
         }
   }
}

// MARK: - Toast Model
struct Toast: Identifiable, Equatable {
   private(set) var id: String = UUID().uuidString
   
   var title: String
   var duration: CGFloat = 2.5
   var placementOffset: CGFloat = 0
   var transitionOffset: CGFloat = -100
   var symbol: String? = nil
   var actionTitle: String? = nil
   var actionTint: Color = .blue
   var action: (() -> Bool)? = nil
   
   static func == (lhs: Toast, rhs: Toast) -> Bool {
      lhs.id == rhs.id
   }
}

// MARK: - Environment Extensions
extension EnvironmentValues {
   @Entry var showToast: (Toast) -> Void = { _ in }
   @Entry var dismissToast: () -> Void = { }
}

//
//  ContentView.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 07/08/26.
//

import SwiftUI
import SwiftData

struct RootView: View {
   @State private var networkMonitor = NetworkMonitor()
   @Query private var cartItems: [CartItem]
   
   private var totalOrderCount: Int {
      cartItems.reduce(0) { $0 + $1.count }
   }
   
   var body: some View {
      ToastRootView {
         ZStack(alignment: .top) {
            
            TabView {
               Tab("Menu", systemImage: "house") {
                  MenuView()
               }
               
               Tab("Coins", systemImage: "bitcoinsign.arrow.trianglehead.counterclockwise.rotate.90") {
                  CoinsView()
               }
               
               Tab("Qr-code", systemImage: "qrcode.viewfinder") {
                  QrCodeView()
               }
               
               Tab("Cart", systemImage: "cart") {
                  OrderView()
               }
               .badge(totalOrderCount)
               
               Tab("Settings", systemImage: "gear") {
                  SettingsView()
               }
            } //: TABVIEW
            
            if !networkMonitor.isConnected {
               RoundedRectangle(cornerRadius: 30)
                  .fill(.clear)
                  .frame(height: 100)
                  .glassEffect(.regular, in: .rect(cornerRadius: 30))
                  .padding(.horizontal)
                  .overlay {
                     HStack {
                        Image(systemName: "network.slash")
                           .font(.system(size: 40))
                        Text("Network is unavailable")
                           .font(.title2.weight(.bold))
                           .fontDesign(.serif)
                     }
                  }
                  .transition(
                     .asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom))
                  )
            }
         } //: ZSTACK
         .animation(.easeOut, value: networkMonitor.isConnected)
      }
   }
}
   
#Preview {
   RootView()
      .modelContainer(for: CartItem.self, inMemory: true)
}

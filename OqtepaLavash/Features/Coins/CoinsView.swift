//
//  CoinsView.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 07/08/26.
//

import SwiftUI

struct CoinsView: View {
   //MARK: - PROPERTIES
   @State private var showAlertLogoutPorfile: Bool = false
   @State private var showAlertDeleteProfile: Bool = false
   
   let image: String = ""
   //MARK: - BODY
   
   var body: some View {
      NavigationStack {
         ScrollView {
            VStack {
               CoinsTitleCard()
               
               CoinsCashbackCard()
               
               ShareLinkButton()
               
               VStack(spacing: 16) {
                  CoinsListItemView(name: "QR-kodni ko'rsatish", imageName: "qrcode")
                  Divider()
                  
                  CoinsListItemView(name: "Buyurtmalar tarixi", imageName: "document.badge.clock")
                  Divider()
                  
                  CoinsListItemView(name: "Ballar qo'shilishi", imageName: "dollarsign.circle")
                  Divider()
                  
                  CoinsListItemView(name: "Sadoqat dasturi taklifi", imageName: "star")
               }
               .modifier(CoinsListBackgroundModifier())
               
               VStack(spacing: 16) {
                  Button {
                     showAlertLogoutPorfile = true
                  } label: {
                  CoinsListItemView(name: "Profildan chiqish", imageName: "rectangle.portrait.and.arrow.right")
                  }
                  .alert("Are you sure you want to log out?", isPresented: $showAlertLogoutPorfile) {
                     Button("Cancel", role: .cancel) {}
                     Button("Yes, log out", role: .destructive) {}
                  }
                  
                  Divider()
                  
                  Button {
                     showAlertDeleteProfile = true
                  } label: {
                     CoinsListItemView(name: "Profilni o'chirish", imageName: "person.fill.xmark")
                  }
                  .alert("Shaxsiy profilingiz o'chirilsinmi?", isPresented: $showAlertDeleteProfile) {
                     Button("Cancel", role: .cancel) {}
                     Button("Delete", role: .destructive) {}
                  } message: {
                     Text("O'chirilgandan so'ng, telefon raqamingiz ushbu profil bilan boglanmaydi. Ma'lumotlaringiz, bonus ballaringiz va buyurtmalar tarixi o'chirib tashlanadi.")
                  }
               }
               .modifier(CoinsListBackgroundModifier())
               
            } //: VSTACK
            .padding()
         } //: SCROLL
         
      } //: NAVIGATION
   }
}

#Preview {
   CoinsView()
}

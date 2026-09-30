//
//  SettingsView.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 07/08/26.
//

import SwiftUI

struct SettingsView: View {
   
   let settingsItems: [SettingsListModel] = [
      SettingsListModel(title: "Menyu", icon: "menu", route: .menu),
      SettingsListModel(title: "Buyurtmalar tarixi", icon: "file-2", route: .orderHistory),
      SettingsListModel(title: "System Language", icon: "internet", route: .systemLanguage),
      SettingsListModel(title: "Savat", icon: "shopping-cart", route: .cart),
   ]
   
   var body: some View {
      NavigationStack {
         VStack {
            List {
               //MARK: - PROFILE SETTINGS
               NavigationLink(value: SettingsRoute.profile) {
                  HStack(spacing: 16) {
                     SettingsProfileImage()
                     
                     VStack(alignment: .leading) {
                        Text("Asadbek Saydullayev")
                           .font(.headline)
                        
                        Text("tel: +998 94 681 81 42")
                     } //: VSTACK
                  } //: HSTACK
               }

               
               ForEach(settingsItems) { item in
                  NavigationLink(value: item.route) {
                     HStack {
                        Image(item.icon)
                           .renderingMode(.template)
                           .resizable()
                           .scaledToFit()
                           .frame(width: 25, height: 25)
                        Text(item.title)
                     } //: HSTACK
                  } // NAVIGATION LINK
               } //: LOOP
            } //: LIST
         } //: VSTACK
         .navigationTitle("Settings")
         //MARK: - NAVIGATION DESTINATION
         .navigationDestination(for: SettingsRoute.self) { route in
            switch route {
               case .profile:
                  ProfileView()
               case .menu:
                  SettingsMenuView()
               case .orderHistory:
                  OrderHistoryView()
               case .systemLanguage:
                  Text("Savat Sahifasi")
               case .cart:
                  CartView()
            }
         }
      } //: NAVIGATION
   }
}





#Preview {
   SettingsView()
}

//
//  SettingsProfileImage.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 08/09/26.
//

import SwiftUI

struct SettingsProfileImage: View {
    var body: some View {
       Image("avatar3")
          .resizable()
          .scaledToFill()
          .frame(width: 60, height: 60)
          .background(.orange.gradient)
          .clipShape(.circle)
          .overlay {
             Circle().stroke(.white, lineWidth: 2)
          }
    }
}

#Preview {
    SettingsProfileImage()
}

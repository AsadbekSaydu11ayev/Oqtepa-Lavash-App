//
//  LogoCoin.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 08/09/26.
//

import SwiftUI

struct LogoCoin: View {
    var body: some View {
        Image("coin")
          .renderingMode(.template)
          .resizable()
          .scaledToFit()
          .frame(width: 16)
    }
}

#Preview {
    LogoCoin()
}

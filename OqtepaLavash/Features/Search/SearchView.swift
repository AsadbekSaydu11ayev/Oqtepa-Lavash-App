//
//  SearchView.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 07/08/26.
//

import SwiftUI

struct SearchView: View {
   @Environment(\.dismiss) private var dismiss
   @State private var searchText: String = ""
   @FocusState private var focused
   
    var body: some View {
       VStack(alignment: .leading) {
          Button {
             dismiss()
          } label: {
             Image(systemName: "x.circle")
                .font(.title)
                .foregroundStyle(Color.primary)
          }
          .buttonStyle(.glass)
          .buttonBorderShape(.circle)
          .frame(maxWidth: .infinity, alignment: .leading)
          
          
          TextField("Search", text: $searchText)
             .padding(.horizontal)
             .frame(height: 50)
             .glassEffect()
             .shadow(color: .secondary, radius: 5)
             .textInputAutocapitalization(.never)
             .autocorrectionDisabled()
             .focused($focused)
          
          Spacer()
       } //: VSTACK
       .padding()
       .contentShape(.rect)
       .onTapGesture(count: 1) {
          focused = false
       }
    }
}

#Preview {
    SearchView()
}

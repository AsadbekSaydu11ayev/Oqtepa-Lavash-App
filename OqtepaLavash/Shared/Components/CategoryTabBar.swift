//
//  CategoryTabBar.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 07/08/26.
//

import SwiftUI

struct CategoryTabBar: View {
   //MARK: - PROPERTIES

   let categories: [CategoryModel]
   let scrollProxy: ScrollViewProxy
   @Binding var activeSectionId: String?
   
   @State private var currCategory: String?
   //MARK: - BODY
   
    var body: some View {
       ScrollViewReader { proxy in
          ScrollView(.horizontal, showsIndicators: false) {
             HStack {
                ForEach(categories) { category in
                   Button {
                      withAnimation {
                         scrollProxy.scrollTo(category.id, anchor: .top)
                         activeSectionId = category.id
                      }
                   } label: {
                      Text(category.name)
                         .padding(8)
                         .font(.caption.weight(.bold))
                         .foregroundStyle(Color.primary)
                         .glassEffect(.clear.tint(activeSectionId == category.id ? .orange : .teal.opacity(0.3)), in: .capsule)
                         .animation(.easeOut, value: currCategory)
                   } //: BUTTON
                } //: LOOP
             } //: HSTACK
             .padding(.horizontal)
          } //: SCROLL
          .onChange(of: activeSectionId) { _, newValue in
             if let newValue {
                withAnimation {
                   proxy.scrollTo(newValue, anchor: .center)
                }
             }
          }
       } //: SCROLL READER
    }
}

#Preview {
   @Previewable var viewModel = MenuViewModel()
   @Previewable @State var activeSectionId: String?
   ScrollViewReader { proxy in
      CategoryTabBar(categories: viewModel.categories, scrollProxy: proxy, activeSectionId: $activeSectionId)
         .padding(.horizontal)
         .task {
            await viewModel.loadMenu()
            print(viewModel.categories[0].name)
         }
   }
}


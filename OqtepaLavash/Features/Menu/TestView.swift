//
//  TestView.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 9/19/26.
//

import SwiftUI
import Kingfisher

struct TestView: View {
   //MARK: - PROPERTIES

   @State private var viewModel = MenuViewModel()
   
   //MARK: - BODY
   var body: some View {
      NavigationStack {
         ZStack {
            LinearGradient(colors: [.teal, .orange], startPoint: .top, endPoint: .bottom)
               .ignoresSafeArea()
            
            if viewModel.isLoading {
               ProgressView()
                  .scaleEffect(1.5)
            } else if let error = viewModel.errorMessage {
               Text(error)
            } else {
               ScrollViewReader { proxy in
                  ScrollView {
                     LazyVStack {
                        ForEach(viewModel.categories) { category in
                           Section {
                              VStack {
                                 ForEach(viewModel.products(in: category)) { item in
                                    VStack {
                                       if let image = item.imageUrl, let imageURL = URL(string: image) {
                                          KFImage(imageURL)
                                             .placeholder {
                                                ProgressView()
                                                   .scaleEffect(1.4)
                                             }
                                             .resizable()
                                             .scaledToFit()
                                             .frame(width: 150)
                                       }
                                       
                                       Text(item.name)
                                          .foregroundStyle(.black)
                                          .fontWeight(.bold)
                                          .fontDesign(.serif)
                                       Text(item.description)
                                       Text("\(String(format: "%.2f", item.price))")
                                    }
                                 }
                              }
                           } header: {
                              Text(category.name)
                                 .font(.title.weight(.bold))
                                 .foregroundStyle(.white)
                                 .fontDesign(.serif)
                                 .padding(.vertical)
                           }
                           
                        }
                     } //: LAZYVSTACK
                  } //: SCROLL
               } //: SCROLL READER
            }
         } //: ZSTACK
         .task {
            await viewModel.loadMenu()
         }
      } //: NAVIGATION
   }
}


#Preview {
   TestView()
}

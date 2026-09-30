//
//  MenuView.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 07/08/26.
//

import SwiftUI

struct MenuView: View {
   //MARK: - PROPERTIES
   
   @State private var menuViewModel = MenuViewModel()
   
   @State private var choosingLocation: Bool = true
   @State private var showingSearchView: Bool = false
   @State private var activeSectionId: String?
   @Namespace private var namespace
   
   let gridItems: [GridItem] = Array(repeating: .init(.adaptive(minimum: 160, maximum: 250), spacing: 16), count: 1)
   
   let bannerImages: [String] = [
      "banner-chegirma", "banner-shaurma"
   ]
   
   //MARK: - BODY
   
   var body: some View {
      NavigationStack {
         ScrollViewReader { proxy in
            ScrollView {
               LazyVStack(pinnedViews: [.sectionHeaders]) {
                  //MARK: - LOCATION
                  
                  LocationView()
                     .padding(.horizontal)
                  
                  //MARK: - BANNER
                  
                  BannerSliderView(images: bannerImages)
                     .padding(.bottom, 20)
                  
                  
                  
                  if menuViewModel.isLoading {
                     skeletonProductSection
                        .transition(.opacity)
                  } else {
                     Section {
                        VStack(spacing: 16) {
                           ForEach(menuViewModel.categories) { category in
                              VStack(alignment: .leading, spacing: 12) {
                                 Text(category.name)
                                    .foregroundStyle(.primary)
                                    .font(.title.weight(.bold))
                                    .fontDesign(.serif)
                                    .padding(.vertical)
                                 
                                 // Mahsulotlar Tarmog'i
                                 LazyVGrid(columns: gridItems, spacing: 16) {
                                    ForEach(menuViewModel.products(in: category)) { item in
                                       NavigationLink(value: item) {
                                          ProductCard(image: item.imageUrl, title: item.name, price: "\(item.price)", description: item.description)
                                       }
                                    }
                                 }
                              }
                              // AYNAN SHU YERDA ID BERISH SHART:
                              .id(category.id)
                           }
                        }
                        .scrollTargetLayout()
                        .padding(.horizontal)
                     } header: {
                        ZStack {
                           CategoryTabBar(categories: menuViewModel.categories, scrollProxy: proxy, activeSectionId: $activeSectionId)
                        } //: ZSTACK
                        .padding(.vertical, 10)
                        .background(
                           Color(.systemBackground).opacity(0.8)
                        )
                     }
                        .transition(.opacity)
                  }
                  
                  
               } //: LAZYVSTACK
            } //: SCROLL
            .scrollPosition(id: $activeSectionId, anchor: .top)
            .refreshable {
               Task {
                  await menuViewModel.refreshMenu()
               }
            }
         } //: SCROLL READER
         .sheet(isPresented: $showingSearchView) {
            SearchView()
               .presentationDragIndicator(.visible)
         }
         .navigationTitle("Oqtepa Lavash")
         .navigationBarTitleDisplayMode(.inline)
         .navigationDestination(for: ProductModel.self) { item in
            ProductView(product: item)
         }
         .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
               //MARK: - SEARCH BUTTON
               Button {
                  showingSearchView = true
               } label: {
                  Image(systemName: "magnifyingglass")
               } //: SEARCH BUTTON
            }
         }
         .task {
            await menuViewModel.loadMenu()
         }
      } //: NAVIGATION
   }
   
   // MARK: - SKELETON LOADING SECTION
   private var skeletonProductSection: some View {
      VStack(alignment: .leading, spacing: 20) {
         // Category TabBar Skeleton
         ScrollView(.horizontal, showsIndicators: false) {
            HStack {
               ForEach(0...10, id: \.self) { index in
                  Button {
                     
                  } label: {
                     Text("Burgerlar")
                        .padding(8)
                        .font(.caption.weight(.bold))
                        .foregroundStyle(Color.primary)
                        .glassEffect(.regular, in: .capsule)
                  } //: BUTTON
               } //: LOOP
            } //: HSTACK
            .blur(radius: 2)
            .padding(.horizontal)
            .padding(.top, 10)
         } //: SCROLL
         .redacted(reason: .placeholder)
         .shimmering()
         
         Section {
            LazyVGrid(columns: gridItems, spacing: 16) {
               ForEach(0...16, id: \.self) { index in
                  ProductCard(image: "http://localhost:4000/uploads/5a1a0f80-d2bc-4598-9d6f-6f70ab0f27bc.png", title: "tandir lavash", price: "38000 UZS", description: "Pizza app")
                     .blur(radius: 2)
                  
               } //: LOOP PRODUCT
            }
            .padding()
         } header: {
            Text("Lavash")
               .foregroundStyle(.primary)
               .frame(maxWidth: .infinity, alignment: .leading)
               .font(.title.weight(.bold))
               .fontDesign(.serif)
               .padding(.leading)
               .blur(radius: 2)
         }
         .redacted(reason: .placeholder)
      }
   }
}


#Preview {
   MenuView()
}

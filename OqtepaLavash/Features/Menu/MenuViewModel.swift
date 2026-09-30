//
//  MenuViewModel.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 9/19/26.
//

import SwiftUI

@Observable
final class MenuViewModel {
   // View shu holatlarga qarab UI chizadi
   var categories: [CategoryModel] = []
   var products: [ProductModel] = []
   var isLoading = false
   var errorMessage: String?
   private var isDataLoaded: Bool = false
   
   private let api: APIClient
   
   init(api: APIClient = .shared) {
      self.api = api
   }
   
   func loadMenu() async {
      guard !isDataLoaded else { return }
      await fetchMenu()
   }
   
   func refreshMenu() async {
      await fetchMenu()
   }
   
   private func fetchMenu() async {
      isLoading = true
      errorMessage = nil
      
      do {
         async let cats: [CategoryModel] = api.get(APIEndpoint.categories)
         async let prods: [ProductModel] = api.get(APIEndpoint.products())
         categories = try await cats
         products = try await prods
      } catch {
         errorMessage = "Menyuni yuklab bo'lmadi. Qayta urinib ko'ring."
      }

         withAnimation(.easeInOut(duration: 0.5)) { // 0.5 soniyalik silliq o'tish
            self.isLoading = false
            self.isDataLoaded = true
         }
   }
   
   func products(in category: CategoryModel) -> [ProductModel] {
      products.filter { $0.categoryId == category.id }
   }
}

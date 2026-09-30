//
//  ProductViewModel.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 9/19/26.
//
//
import Foundation
import SwiftData

@Observable
final class ProductViewModel {
   
   let product: ProductModel
   var orderCount: Int = 1
   
   init(product: ProductModel) {
      self.product = product
   }
   
   var orderSum: Double {
      return product.price * Double(orderCount)
   }
   
   func incrementCount() {
      if orderCount < 50 {
         orderCount += 1
      }
   }
   
   func decrementCount() {
      if orderCount > 1 {
         orderCount -= 1
      }
   }
   
   func addToCart(context: ModelContext, existingItem: [CartItem]) {
      if let existingItem = existingItem.first(where: { $0.id == product.id }) {
         existingItem.count += orderCount
      } else {
         let newItem = CartItem(
            id: product.id,
            count: orderCount,
            name: product.name,
            price: product.price, // Birlik narxi berilishi kerak
            categoryId: product.categoryId,
            itemDescription: product.description,
            available: product.available,
            imageURL: product.imageUrl
         )
         
         context.insert(newItem)
      }
   }
}

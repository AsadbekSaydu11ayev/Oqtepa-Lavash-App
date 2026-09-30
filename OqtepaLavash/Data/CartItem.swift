//
//  OrderData.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 9/19/26.
//

import Foundation
import SwiftData


@Model
class CartItem {
   var id: String
   var count: Int
   var name: String
   var price: Double
   var categoryId: String?
   var itemDescription: String
   var available: Bool
   var imageUrl: String?
   var createdAt: Date
   
   init(id: String, count: Int, name: String, price: Double, categoryId: String?, itemDescription: String, available: Bool, imageURL: String?, createdAt: Date = Date()) {
      self.id = id
      self.count = count
      self.name = name
      self.price = price
      self.categoryId = categoryId
      self.itemDescription = itemDescription
      self.available = available
      self.imageUrl = imageURL
      self.createdAt = createdAt
   }
}

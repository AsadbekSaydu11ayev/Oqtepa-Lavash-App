//
//  OrderModel.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 9/19/26.
//

import Foundation


struct OrderModel: Encodable, Identifiable, Hashable {
   let id: String
   let count: Int
   let name: String
   let price: Double
   let categoryId: String?
   let description: String
   let available: Bool
   let imageUrl: String?
}

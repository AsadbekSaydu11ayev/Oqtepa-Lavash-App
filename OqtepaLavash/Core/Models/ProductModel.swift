//
//  ProductModel.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 08/08/26.
//

import Foundation

struct ProductModel: Decodable, Identifiable, Hashable {
   let id: String
   let name: String
   let price: Double
   let categoryId: String?
   let description: String
   let available: Bool
   let imageUrl: String?
}

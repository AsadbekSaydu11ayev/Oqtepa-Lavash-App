//
//  CategoryModel.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 9/19/26.
//

import Foundation

struct CategoryModel: Decodable, Identifiable, Hashable {
   let id: String
   let name: String
   let order: Int
   let createdAt: String
}

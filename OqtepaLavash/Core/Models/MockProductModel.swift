//
//  ProductModel.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 08/08/26.
//

import Foundation

struct MockProductModel: Identifiable, Hashable {
   let id: UUID = UUID()
   let title: String
   let price: String
   let description: String
   let image: String
}

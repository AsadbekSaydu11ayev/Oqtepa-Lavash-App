//
//  NewOrderModel.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 9/19/26.
//

import Foundation

struct NewOrderRequest: Encodable {
   let customerName: String
   let phone: String
   let items: [OrderItemRequest]
}
struct OrderItemRequest: Encodable {
   let productId: String
   let qty: Int
}

//
//  APIEndpoint.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 9/19/26.
//

import Foundation

enum APIEndpoint {
//   static let baseURL = "https://unsmooth-moneywise-tannery.ngrok-free.dev"
   static let baseURL = "http://localhost:4000"
   
   case categories
   case products(categoryId: String? = nil)
   case createOrder
   case orderStatus(id: String)
   case branches
   
   var url: URL {
      switch self {
            
         case .categories:
            return URL(string: "\(Self.baseURL)/api/categories")!
            
         case .products(categoryId: let categoryId):
            var comps = URLComponents(string: "\(Self.baseURL)/api/products")!
            if let categoryId {
               comps.queryItems = [.init(name: "categoryId", value: categoryId)]
            }
            return comps.url!
            
         case .createOrder:
            return URL(string: "\(Self.baseURL)/api/orders")!
            
         case .orderStatus(id: let id):
            return URL(string: "\(Self.baseURL)/api/orders/\(id)")!
            
         case .branches:
            return URL(string: "\(Self.baseURL)/api/branches")!
      }
   }
   
   var method: String {
      switch  self {
         case .createOrder:
            return "POST"
         default:
            return "GET"
      }
   }
   
   var request: URLRequest {
      var req = URLRequest(url: url)
      req.httpMethod = method
      req.setValue("true", forHTTPHeaderField: "ngrok-skip-browser-warning")
      req.setValue("application/json", forHTTPHeaderField: "Content-Type")
      req.setValue("application/json", forHTTPHeaderField: "Accept")
      return req
   }
}

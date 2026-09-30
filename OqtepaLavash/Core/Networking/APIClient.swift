//
//  APIClient.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 9/19/26.
//

import Foundation

final class APIClient {
   static let shared = APIClient()
   private let decoder = JSONDecoder()
   
   
   func get<T: Decodable>(_ endpoint: APIEndpoint) async throws -> T {
      let (data, response) = try await URLSession.shared.data(for: endpoint.request)
      try validate(response)
      return try decoder.decode(T.self, from: data)
   }
   
   func post<T: Decodable>(_ endpoint: APIEndpoint, body: Encodable) async throws -> T {
//      var request = URLRequest(url: endpoint.url)
//      request.httpMethod = "POST"
//      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      var request = endpoint.request
      
      request.httpBody = try JSONEncoder().encode(body)
      
      let (data, response) = try await URLSession.shared.data(for: request)
      try validate(response)
      return try decoder.decode(T.self, from: data)
   }
   
   private func validate(_ response: URLResponse) throws {
      guard let http = response as? HTTPURLResponse else {
         throw APIError.serverError(statusCode: 0)
      }
      
      guard (200...299).contains(http.statusCode) else {
         throw APIError.serverError(statusCode: http.statusCode)
      }
   }
}

//
//  APIError.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 9/19/26.
//

import Foundation

enum APIError: Error {
   case invalidURL
   case serverError(statusCode: Int)
   case decodingFailed
   case noConnection
   case unknown(Error)
}

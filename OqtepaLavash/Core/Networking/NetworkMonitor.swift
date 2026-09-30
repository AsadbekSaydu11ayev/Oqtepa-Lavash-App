//
//  NetworkMonitor.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 22/09/26.
//

import Foundation
import Network


@Observable
final class NetworkMonitor {
   private(set) var isConnected = false
   
   private let monitor = NWPathMonitor()
   private let queue = DispatchQueue(label: "NetworkMonitor")
   
   init() {
      monitor.pathUpdateHandler = { [weak self] path in
         Task { @MainActor in
            self?.isConnected = path.status == .satisfied
         }
      }
      
      monitor.start(queue: queue)
   }
   
   deinit {
      monitor.cancel()
   }
}

//
//  OrderViewModel.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 9/19/26.
//

import Foundation
import SwiftData

@Observable
class OrderViewModel {
   
   //MARK: - ALL DELETE OF ALL DATA
   func deleteAllData(_ items: [CartItem],  context: ModelContext) {
      for item in items {
         context.delete(item)
      }
      
      do {
         try context.save()
      } catch {
         print("Ochirishda xatolik chiqdi \(error.localizedDescription)")
      }
   }

}

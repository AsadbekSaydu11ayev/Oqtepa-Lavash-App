//
//  ConvertToNGROKExtension.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 9/19/26.
//

import Foundation

extension String {
   // Localhost manzilini Ngrok manziliga almashtiruvchi yordamchi funksiya
   func formattedImageURL() -> String {
      let ngrokBaseURL = "https://unsmooth-moneywise-tannery.ngrok-free.dev" // O'zingizning ngrok havolangiz
      return self.replacingOccurrences(of: "http://localhost:4000", with: ngrokBaseURL)
   }
}

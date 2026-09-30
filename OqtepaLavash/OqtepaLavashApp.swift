//
//  OqtepaLavashApp.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 07/08/26.
//

import SwiftUI
import SwiftData

@main
struct OqtepaLavashApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: CartItem.self)
    }
}

//
//  SettingsListModel.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 12/09/26.
//

import Foundation

struct SettingsListModel: Identifiable, Hashable {
   let id = UUID()
   let title: String
   let icon: String
   let route: SettingsRoute
}

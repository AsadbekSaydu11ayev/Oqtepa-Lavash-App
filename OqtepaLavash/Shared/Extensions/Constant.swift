//
//  Constant.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 13/08/26.
//

import SwiftUI

let cashbackCardBackground = MeshGradient(
   width: 3,
   height: 2,
   points: [
      [0, 0], [0.5, 0], [1, 0],
      [0, 1], [0.5, 1], [1, 1],
   ],
   colors: [
      .orange, .red, .orange,
      .orange, .red, .orange
   ]
)

let promocodeText: String = """
5000 UZS uchun promo-kod — HEMS:

1. Oqtepa Lavash ilovasini yuklab oling: x.foodpicasso.com/x/3181

2. "Aksiyalar" bo‘limiga o‘ting va "Diqqat! Bonuslar!" aksiyasini tanlang

3. Ro‘yxatdan o‘tgach, promo-kodni «HEMS» kiriting va birinchi buyurtmangiz uchun 5000 UZS bonus oling!
"""

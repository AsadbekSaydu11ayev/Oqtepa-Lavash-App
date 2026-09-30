//
//  OrderView.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 07/08/26.
//

import SwiftUI
import SwiftData
import Lottie

struct OrderView: View {
   //MARK: - PROPERTIES
   
   @Environment(\.modelContext) private var modelContext
   @Environment(\.showToast) private var showToast
   @Query(sort: \CartItem.createdAt, order: .forward) private var cartItems: [CartItem]
   
   @State private var viewModel = OrderViewModel()
   
   @State private var orderCount: Int = 1
   @State private var isBonus: Bool = false
   @State private var showAlert: Bool = false
   @State private var bonus: Double = 2000
   
   //MARK: - BODY

    var body: some View {
       NavigationStack {
          ZStack {
             if !cartItems.isEmpty {
                ScrollView {
                   VStack(alignment: .leading, spacing: 16) {
                      //MARK: - LOCATION
                      LocationView()
                      
                      //MARK: - ORDER LIST
                      ForEach(cartItems) { item in
                         OrderListView(cartItem: item)
                         Divider()
                      }
                      
                      //MARK: - EXTRA FOODS
                      Section {
                         OrderExtraFood()
                      } header: {
                         Text("Buyurtmaga qo'shish?")
                            .font(.title2.weight(.bold))
                      } //: SECTION
                      
                      //MARK: - EXTRA ITEMS
                      VStack(spacing: 16) {
                         OrderExtraItem(image: "paper-bag", text: "Dastavka uchun nabor", isFree: "bepul", minLimitCount: 0)
                         
                         Divider()
                         
                         OrderExtraItem(image: "paper-bag-2", text: "Paket", summa: "1000", maxLimitCount: 1, minLimitCount: 1)
                         
                         OrderPromocode(price: "1730,57", isDiscount: $isBonus)
                            .padding(-16)
                      } //: VSTACK
                      .padding()
                      .modifier(OrderCartBackgroundModifier())
                      
                      OrderPirceinfo(price: 50000, isBonus: $isBonus, bonus: $bonus)
                   } //: VSTACK
                   .padding()
                } //: SCROLL
             } else {
                VStack {
                   LottieView(animation: .named("empty"))
                      .looping()
                      .resizable()
                      .scaledToFit()
                      .frame(width: 250, height: 250)
                   
                   Text("Sizning savatingizda buyurtmalar mavjud emas")
                }
             }
          } //: ZSTACK
          .animation(.easeOut, value: cartItems.isEmpty)
          .navigationTitle("Buyurtmalaringiz")
          .safeAreaInset(edge: .bottom) {
             if !cartItems.isEmpty {
                Button {
                   
                } label: {
                   Text("To'lovga o'tish")
                      .foregroundStyle(.white)
                } //: BUTTON
                .buttonStyle(.glassProminent)
                .buttonSizing(.flexible)
                .controlSize(.large)
                .tint(.orange)
                .padding()
                .background(Color(uiColor: .systemBackground))
             }
          }
          .toolbar {
             ToolbarItem(placement: .topBarTrailing) {
                Button("", systemImage: "trash") {
                   showAlert = true
                }
                .tint(.red)
                .alert("Oqtepa Lavash", isPresented: $showAlert) {
                   Button("Cancel", role: .cancel) {}
                   
                   Button("Delete", role: .destructive) {
                      viewModel.deleteAllData(cartItems, context: modelContext)
                   }
                } message: {
                   Text("Savatchangizning tarkibini tozalashni xohlaysizmi?")
                }
             }
          }
       } //: NAVIGATION
    }
}

#Preview {
   
   let container = try! ModelContainer(for: CartItem.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
   
   let newItem1 = CartItem(id: "47ed86de-2fdb-445c-b4ac-801e5b789676", count: 3, name: "Talaba seti 1", price: 39000, categoryId: "527fe61b-f95d-491f-8378-41b640a413fd", itemDescription: "juda mazali", available: true, imageURL: "http://localhost:4000/uploads/5a1a0f80-d2bc-4598-9d6f-6f70ab0f27bc.png")
   
   let newItem2 = CartItem(id: "555", count: 3, name: "Talaba seti 1", price: 39000, categoryId: "527fe61b-f95d-491f-8378-41b640a413fd", itemDescription: "juda mazali", available: true, imageURL: "http://localhost:4000/uploads/5a1a0f80-d2bc-4598-9d6f-6f70ab0f27bc.png")
   
   let newItem3 = CartItem(id: "9890", count: 3, name: "Talaba seti 1", price: 39000, categoryId: "527fe61b-f95d-491f-8378-41b640a413fd", itemDescription: "juda mazali", available: true, imageURL: "http://localhost:4000/uploads/5a1a0f80-d2bc-4598-9d6f-6f70ab0f27bc.png")
   
//   container.mainContext.insert(newItem1)
//   container.mainContext.insert(newItem2)
//   container.mainContext.insert(newItem3)
   
    return OrderView()
      .modelContainer(container)
}

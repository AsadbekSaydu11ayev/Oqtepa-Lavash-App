//
//  OrderListView.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 08/09/26.
//

import SwiftUI
import SwiftData
import Kingfisher

struct OrderListView: View {
   //MARK: - PROPERTIES
   @Environment(\.modelContext) private var modelContext
   @Bindable var cartItem: CartItem
   
   var orderSumm: Double {
      return cartItem.price * Double(cartItem.count)
   }
   //MARK: - BODY

    var body: some View {
       HStack {
          
          ZStack {
             if let image = cartItem.imageUrl?.formattedImageURL(), let imageURL = URL(string: image) {
                KFImage(imageURL)
                   .placeholder {
                      ProgressView()
                   }
                   .resizable()
                   .scaledToFit()
             } else {
                Image(systemName: "photo.slash")
                   .foregroundStyle(.secondary)
                   .font(.system(size: 25))
             }
          } //: ZSTACK
          .frame(width: 60, height: 60)
          
          VStack(alignment: .leading) {
             Text(cartItem.name)
                .foregroundStyle(Color.primary)
             
             Text(cartItem.itemDescription)
             .font(.caption)
             .foregroundStyle(.secondary)
             .multilineTextAlignment(.leading)
             .lineSpacing(-6)
             .lineLimit(3)
             HStack {
                Text("\(String(format: "%.2f", orderSumm)) UZS")
                   .font(.body.weight(.bold))
                
                Spacer()
                HStack {
                   Button {
                      if cartItem.count > 1 {
                         cartItem.count -= 1
                      } else {
                         withAnimation {
                            modelContext.delete(cartItem)
                         }
                      }
                   } label: {
                      Image(systemName: "minus")
                         .foregroundStyle(.white)
                         .frame(width: 30, height: 30)
                         .background(.black, in: .rect(cornerRadius: 10))
                         .overlay {
                            RoundedRectangle(cornerRadius: 10)
                               .stroke(Color.primary, lineWidth: 0.5)
                         }
                         .shadow(color: Color.primary, radius: 5)
                   }
                   
                   Text("\(cartItem.count)")
                      .frame(minWidth: 25)
                      .foregroundStyle(Color.primary)
                      .font(.title2.weight(.bold))
                   Button {
                      if cartItem.count <= 50 {
                         cartItem.count += 1
                      }
                   } label: {
                      Image(systemName: "plus")
                         .foregroundStyle(.white)
                         .frame(width: 30, height: 30)
                         .background(.black, in: .rect(cornerRadius: 10))
                         .overlay {
                            RoundedRectangle(cornerRadius: 10)
                               .stroke(Color.primary, lineWidth: 0.5)
                         }
                         .shadow(color: Color.primary, radius: 5)
                   }
                } //: HSTACK BUTTON
             } //: HSTACK
          } //: VSTACK
       } //: HSTACK
    }
}

#Preview {
   let container = try! ModelContainer(for: CartItem.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
   
   let newItem3 = CartItem(id: "47ed86de-2fdb-445c-b4ac-801e5b789676", count: 3, name: "Talaba seti 1", price: 39000, categoryId: "527fe61b-f95d-491f-8378-41b640a413fd", itemDescription: "juda mazali", available: true, imageURL: "http://localhost:4000/uploads/5a1a0f80-d2bc-4598-9d6f-6f70ab0f27bc.png")
   container.mainContext.insert(newItem3)
   
   return OrderListView(cartItem: newItem3)
      .modelContainer(container)
      .padding()
}

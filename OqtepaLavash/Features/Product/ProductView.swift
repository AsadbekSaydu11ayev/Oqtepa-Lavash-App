//
//  ProductView.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 08/08/26.
//

import SwiftUI
import Kingfisher
import SwiftData

struct ProductView: View {
   //MARK: - PROPERTIES
   
   @Environment(\.modelContext) private var modelContext
   @Environment(\.showToast) private var showToast
   
   @Query private var existingCartItem: [CartItem]
   private let viewModel: ProductViewModel
   
   init(product: ProductModel) {
         self.viewModel = ProductViewModel(product: product)
   }


   //MARK: - BODY
   
   var body: some View {
      VStack {
         ScrollView {
            VStack {
               
               if let imageStringURL = viewModel.product.imageUrl?.formattedImageURL(), let imageURL = URL(string: imageStringURL) {
                  KFImage(imageURL)
                     .placeholder {
                        ProgressView()
                           .scaleEffect(1.5)
                     }
                     .resizable()
                     .scaledToFit()
                     .frame(height: 300)
                     .strechyHeader()
               } else {
                  ZStack {
                     Image(systemName: "photo.slash")
                        .foregroundStyle(.secondary)
                        .font(.system(size: 100))
                  }
                  .frame(height: 300)
               }
               
               VStack(alignment: .leading) {
                  HStack {
                     Text(viewModel.product.name)
                        .foregroundStyle(Color.primary)
                        .font(.title3.weight(.bold))
                        .fixedSize(horizontal: false, vertical: true)
                     
                     Spacer()
                     
                     Text("\(String(format: "%.2f", viewModel.product.price)) UZS")
                        .foregroundStyle(Color.primary)
                        .font(.headline)
                        .fixedSize(horizontal: false, vertical: true)
                  } //: HSTACK
                  
                  Text(viewModel.product.description)
                     .foregroundStyle(Color.primary)
                     .padding(.top, 5)
               } //: VSTACK
               .padding(.horizontal)
            } //: VSTACK
         } //: SCROLL
         
         HStack {
            Button {
               viewModel.decrementCount()
            } label: {
               Image(systemName: "minus")
                  .foregroundStyle(.white)
                  .frame(width: 40, height: 40)
                  .background(viewModel.orderCount <= 1 ? Color.secondary : .black, in: .rect(cornerRadius: 10))
                  .overlay {
                     RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary, lineWidth: 0.5)
                  }
                  .shadow(color: Color.primary, radius: 5)
            }
            .disabled(viewModel.orderCount <= 1 ? true : false)
            
            Text("\(viewModel.orderCount)")
               .foregroundStyle(Color.primary)
               .font(.title2.weight(.bold))
               .frame(minWidth: 35)
            Button {
               viewModel.incrementCount()
            } label: {
               Image(systemName: "plus")
                  .foregroundStyle(.white)
                  .frame(width: 40, height: 40)
                  .background(.black, in: .rect(cornerRadius: 10))
                  .overlay {
                     RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary, lineWidth: 0.5)
                  }
                  .shadow(color: Color.primary, radius: 5)
            }
            Spacer()
            Button {
               viewModel.addToCart(context: modelContext, existingItem: existingCartItem)
               viewModel.orderCount = 1
               
               showToast(
                  Toast(
                     title: "Savatga qo'shildi",
                     symbol: "cart.fill.badge.plus",
                     actionTitle: "Bekor qilish",
                  )
               )
               
            } label: {
               HStack(spacing: 3) {
                  Text("Savatchaga...")
                     .lineLimit(1)
                     .layoutPriority(1)
                  Spacer()
                  
                  Text("|")
                  
                  Spacer()
                  Text("\(String(format: "%.2f", viewModel.orderSum)) UZS")
                     .layoutPriority(2)
               } //: HSTACK
               .padding(13)
               .font(.caption.weight(.bold))
               .foregroundStyle(Color.primary)
               .frame(maxWidth: 300)
               .background(.orange, in: .rect(cornerRadius: 10))
            } //: ADD TO ORDER BUTTON
         } //: HSTACK
         .padding()
      } //: VSTACK
   }
}

#Preview {
   let product: ProductModel = ProductModel(id: "47ed86de-2fdb-445c-b4ac-801e5b789676", name: "Talaba seti 1", price: 39000.0, categoryId: Optional("527fe61b-f95d-491f-8378-41b640a413fd"), description: "", available: true, imageUrl: "http://localhost:4000/uploads/5a1a0f80-d2bc-4598-9d6f-6f70ab0f27bc.png")
   
   ProductView(product: product)
}

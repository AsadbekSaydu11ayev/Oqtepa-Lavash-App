//
//  ProfileView.swift
//  OqtepaLavash
//
//  Created by Asadbek Saydullayev on 09/09/26.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
   //MARK: - PROPERTIES

   @FocusState private var focused
   
   @State private var name: String = ""
   @State private var surname: String = ""
   @State private var phoneNumber: String = "+998"
   @State private var email: String = ""
   @State private var selectedItem: PhotosPickerItem?
   @State private var selectedImage: Image?
   @State private var showPhotoLibrary: Bool = false
   @State private var showCamera: Bool = false
   @State private var showFileImporter: Bool = false
   @State private var showAlert: Bool = false
   
   //MARK: - BODY

    var body: some View {
          ZStack {
             ScrollView {
                VStack(spacing: 16) {
                   Menu {
                      Button("Photo Library", systemImage: "photo.fill") {
                         showPhotoLibrary = true
                      }
                      
                      Button("Take a Photo", systemImage: "camera.fill") {
                         showCamera = true
                      }
                      
                      Button("Choose File", systemImage: "folder.fill") {
                         showFileImporter = true
                      }
                      
                      Button("Delete Image", systemImage: "trash.fill") {
                         showAlert = true
                      }
                      
                   } label: {
                      ZStack {
                         if let selectedImage {
                            selectedImage
                               .resizable()
                               .scaledToFill()
                         } else {
                            Image("avatar3")
                               .resizable()
                               .scaledToFit()
                         } //: CONDITION
                      } //: ZSTACK
                      .frame(width: 150, height: 150)
                      .background(.orange)
                      .clipShape(.circle)
                      .overlay {
                         Circle().stroke(.green, lineWidth: 3)
                      }
                   } //: MENU
                   //MARK: - PHOTO PICKER
                   .photosPicker(isPresented: $showPhotoLibrary, selection: $selectedItem, matching: .images)
                   .onChange(of: selectedItem) {
                      Task {
                         if let data = try? await selectedItem?.loadTransferable(type: Data.self), let uiImage = UIImage(data: data) {
                            await MainActor.run {
                               withAnimation {
                                  selectedImage = Image(uiImage: uiImage)
                               }
                            }
                         }
                      }
                   }
                   //MARK: - FILE IMPORTER
                   .fileImporter(isPresented: $showFileImporter, allowedContentTypes: [.image], allowsMultipleSelection: false) { result in
                      switch result {
                         case .success(let urls):
                            guard let url = urls.first else { return }
                            
                            Task {
                               guard url.startAccessingSecurityScopedResource() else { return }
                               defer { url.stopAccessingSecurityScopedResource() }
                               
                               if let data = try? Data(contentsOf: url), let uiImage = UIImage(data: data) {
                                  await MainActor.run {
                                     withAnimation {
                                        selectedImage = Image(uiImage: uiImage)
                                     }
                                  }
                               }
                            }
                         case .failure(let error):
                            print("Failed to read file: \(error.localizedDescription)")
                      }
                   }
                   //MARK: - ALERT VIEW
                   .alert("Delete Image", isPresented: $showAlert) {
                      Button("Cancel", role: .cancel) {}
                      Button("Delete", role: .destructive) {
                         withAnimation {
                            selectedImage = nil
                         }
                      }
                   } message: {
                      Text("Are you really want to delete this photo")
                   }


                   .padding(.bottom)
                   
                   TextField("Ism", text: $name)
                      .modifier(ProfileTextFieldModifier())
                      .focused($focused)
                   
                   TextField("Familya", text: $surname)
                      .modifier(ProfileTextFieldModifier())
                      .focused($focused)
                   
                   TextField("Email", text: $email)
                      .modifier(ProfileTextFieldModifier())
                      .textInputAutocapitalization(.never)
                      .textContentType(.emailAddress)
                      .keyboardType(.emailAddress)
                      .focused($focused)
                   
                   TextField("", text: $phoneNumber)
                      .modifier(ProfileTextFieldModifier())
                      .keyboardType(.numberPad)
                      .focused($focused)
                   
                   Button {
                      focused = false
                   } label: {
                      Text("Save")
                         .font(.headline)
                   }
                   .buttonStyle(.glassProminent)
                   .buttonSizing(.flexible)
                   .controlSize(.large)
                   .tint(.orange)
                   .padding(.top)
                } //: VSTACK
                .padding()
             } //: SCROLL
          } //: ZSTACK
          .onTapGesture {
             focused = false
          }
          .navigationTitle("Profile")
          .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
   NavigationStack {
      ProfileView()
   }
}

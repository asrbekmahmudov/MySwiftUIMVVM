//
//  CreateScreen.swift
//  mycontactswiftui
//
//  Created by Mahmudov Asrbek Ulug'bek o'g'li on 08/11/21.
//

import SwiftUI

struct CreateScreen: View {
    
    @ObservedObject var viewmodel = CreateViewModel()
    @Environment(\.presentationMode) var presentation
    @State private var nameTextField: String = ""
    @State private var phoneTextField: String = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                TextField("Name", text: $nameTextField)
                    .font(.system(size: 17, weight: Font.Weight.bold, design: .rounded))
                    .frame(height: 45)
                    .cornerRadius(10)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5))
                
                TextField("Phone", text: $phoneTextField)
                    .font(.system(size: 15, weight: Font.Weight.bold, design: .rounded))
                    .frame(height: 45)
                    .cornerRadius(10)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5))
                
                Button(action: {
                    viewmodel.contact.name = nameTextField
                    viewmodel.contact.phone = phoneTextField
                    viewmodel.apiContactCreate(contact: viewmodel.contact, handler: { isCreated in
                        if isCreated {
                            self.presentation.wrappedValue.dismiss()
                        }
                    })
                }, label: {
                    HStack {
                        Spacer()
                        Text("Create")
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                }).frame(height: 45)
                .background(Color.black)
                .cornerRadius(10)
            }.padding()
            
            
            if viewmodel.isLoading {
                ProgressView()
            }
        }
    }
}

struct CreateScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateScreen()
    }
}

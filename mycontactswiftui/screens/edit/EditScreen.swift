
import SwiftUI

struct EditScreen: View {
    
    @Environment(\.presentationMode) var presentation
    @State private var nameTextField = ""
    @State private var phoneTextField = ""
    static var contact = Contact()
    var viewmodel = EditViewModel()
    
    init(contact: Contact) {
        EditScreen.contact = contact
    }
    
    init() {
        
    }
    
    var body: some View {
        NavigationView {
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
                        EditScreen.contact.name = nameTextField
                        EditScreen.contact.phone = phoneTextField
                        viewmodel.apiContactEdit(contact: EditScreen.contact as Contact, handler: { isEdited in
                            if isEdited {
                                presentation.wrappedValue.dismiss()
                            }
                        })
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Edit")
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
            }.navigationBarTitle("Edit Contact", displayMode: .inline)
        }.onAppear {
            nameTextField = EditScreen.contact.name!
            phoneTextField = EditScreen.contact.phone!
        }
    }
}

struct EditScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditScreen()
    }
}

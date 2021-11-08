

import SwiftUI

struct ContactScreen: View {
    @ObservedObject var viewmodel = ContactViewModel()
    @State private var showingEdit = false
    static var contact = Contact()
    
    func delete(indexSet: IndexSet) {
        let contact = viewmodel.contacts[indexSet.first!]
        viewmodel.apiContactDelete(contact: contact, handler: { value in
            viewmodel.apiContactList()
        })
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(viewmodel.contacts, id: \.id) { contact in
                        ContactCell(contact: contact).onLongPressGesture {
                            ContactScreen.contact = contact
                            showingEdit.toggle()
                        }
                        .sheet(isPresented: $showingEdit) {
                            EditScreen(contact: ContactScreen.contact)
                        }
                    }.onDelete(perform: delete)
                }.listStyle(PlainListStyle())
                
                if viewmodel.isLoading {
                    ProgressView()
                }
            }
            .navigationBarTitle("Contacts", displayMode: .inline)
            .navigationBarItems(leading:
                                    Button(action: {
                viewmodel.apiContactList()
            }, label: {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(Color.primary)
            }), trailing:
                                    NavigationLink(destination: {
                CreateScreen()
            }, label: {
                Image(systemName: "note.text.badge.plus")
                    .foregroundColor(Color.primary)
            })
            )
        }.onAppear {
            viewmodel.apiContactList()
        }.accentColor(Color.primary)
    }
}

struct ContactScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContactScreen()
    }
}

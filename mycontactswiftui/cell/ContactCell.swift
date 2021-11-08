
import SwiftUI

struct ContactCell: View {
    var contact: Contact
    var body: some View {
        VStack(alignment: .leading) {
            Text(contact.name!.uppercased())
                .fontWeight(.bold)
            Text(contact.phone!)
                .padding(.top, 5)
        }.padding()
    }
}

struct ContactCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactCell(contact: Contact(name: "name", phone: "phone"))
    }
}

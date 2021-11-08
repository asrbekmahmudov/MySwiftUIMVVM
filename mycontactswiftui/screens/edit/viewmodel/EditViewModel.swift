
import Foundation

class EditViewModel: ObservableObject {
    @Published var contact = Contact()
    @Published var isLoading = false
    
    func apiContactEdit(contact: Contact, handler: @escaping (Bool) -> Void) {
        isLoading = true
        AFHttp.put(url: AFHttp.API_CONTACT_UPDATE + contact.id!, params: AFHttp.paramsContactUpdate(contact: contact), handler: { [self] response in
            isLoading = false
            switch response.result {
            case .success:
                print(response.result)
                handler(true)
            case let .failure(error):
                print(error)
                handler(false)
            }
        })
    }
}

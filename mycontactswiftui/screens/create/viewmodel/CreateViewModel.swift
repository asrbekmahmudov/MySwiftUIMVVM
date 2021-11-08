
import Foundation

class CreateViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var contact = Contact()
    
    func apiContactCreate(contact: Contact, handler: @escaping (Bool) -> Void) {
        isLoading = true
        AFHttp.post(url: AFHttp.API_CONTACT_CREATE, params: AFHttp.paramsContactCreate(contact: contact), handler: { [self] response in
            isLoading = false
            switch response.result {
            case .success:
                handler(true)
            case let .failure(error):
                print(error)
                handler(false)
            }
        })
    }
}

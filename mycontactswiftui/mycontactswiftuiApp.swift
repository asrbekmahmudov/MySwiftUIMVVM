//
//  mycontactswiftuiApp.swift
//  mycontactswiftui
//
//  Created by Mahmudov Asrbek Ulug'bek o'g'li on 06/11/21.
//

import SwiftUI

@main
struct mycontactswiftuiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContactScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  jessleApp.swift
//  jessle
//
//  Created by Dan Diemer on 2/11/22.
//

import SwiftUI

@main
struct jessleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

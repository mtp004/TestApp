//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Tri Pham on 2/5/25.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

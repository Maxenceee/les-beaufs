//
//  les_beaufsApp.swift
//  les_beaufs
//
//  Created by Maxence Gama on 01/07/2022.
//

import SwiftUI

@main
struct les_beaufsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

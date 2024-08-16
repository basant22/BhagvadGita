//
//  BhagvadGitaApp.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 16/08/24.
//

import SwiftUI

@main
struct BhagvadGitaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

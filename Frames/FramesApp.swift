//
//  FramesApp.swift
//  Frames
//
//  Created by Zoe Olson on 7/11/23.
//

import SwiftUI

@main
struct FramesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  TaskAppApp.swift
//  TaskApp
//
//  Created by Mehmet Güler on 22.11.2025.
//

import SwiftUI
import SwiftData

@main
struct TaskAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TaskModel.self)
    }
}

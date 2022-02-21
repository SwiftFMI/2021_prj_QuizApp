//
//  Quiz_AppApp.swift
//  Quiz App
//
//  Created by Denislav's Mac Book on 21.02.22.
//

import SwiftUI
import Firebase

@main
struct Quiz_AppApp: App {
    init() { FirebaseApp.configure() }
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

//
//  SwiftCringeApp.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 04/11/2025.
//

import SwiftUI

@main
struct YourAppNameApp: App {
    @State private var session = SessionManager()

    var body: some Scene {
        WindowGroup {
            if session.isLoggedIn {
                MainView(session: session)
            } else {
                LoginView()
            }
        }
    }
}


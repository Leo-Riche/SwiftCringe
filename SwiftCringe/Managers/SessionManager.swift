//
//  SessionManager.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 05/11/2025.
//

import SwiftUI

@Observable
final class SessionManager {
    var currentUser: User?

    private let userDefaultsKey = "currentUserEmail"

    init() {
        loadSession()
    }

    func login(user: User) {
        currentUser = user
        UserDefaults.standard.set(user.email, forKey: userDefaultsKey)
    }

    func logout() {
        currentUser = nil
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
    }

    private func loadSession() {
        if let email = UserDefaults.standard.string(forKey: userDefaultsKey),
           let user = MockData.users.first(where: { $0.email.lowercased() == email.lowercased() }) {
            currentUser = user
        }
    }

    var isLoggedIn: Bool {
        currentUser != nil
    }
}

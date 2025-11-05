//
//  LoginViewModel.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 05/11/2025.
//

import SwiftUI
import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginError: LoginValidationError?
    @Published var isLoggedIn: Bool = false
    @Published var currentUser: User?

    func login() {
        guard !email.isEmpty else {
            loginError = .emptyEmail
            return
        }

        guard let user = MockData.users.first(where: { $0.email.lowercased() == email.lowercased() }) else {
            loginError = .emailNotFound
            return
        }

        guard !password.isEmpty else {
            loginError = .emptyPassword
            return
        }

        guard user.password == password else {
            loginError = .incorrectPassword
            return
        }

        currentUser = user
        isLoggedIn = true
        loginError = nil
    }
}


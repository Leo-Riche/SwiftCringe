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
    
    private let session: SessionManager

    init(session: SessionManager) {
        self.session = session
    }

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

        session.login(user: user)
        loginError = nil
    }
}

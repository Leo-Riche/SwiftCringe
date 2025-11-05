//
//  LoginViewModel.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 05/11/2025.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginError: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var currentUser: User?

    func login() {
        if let user = MockData.users.first(where: {
            $0.email.lowercased() == email.lowercased() && $0.password == password
        }) {
            currentUser = user
            isLoggedIn = true
            loginError = ""
        } else {
            loginError = "Email ou mot de passe incorrect."
        }
    }
}

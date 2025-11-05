//
//  LoginView.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 05/11/2025.
//

import SwiftUI
import DesignSystem

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var loginError = ""
    @State private var isLoggedIn = false
    @State private var currentUser: User?

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Text("Connexion")
                    .font(.largeTitle)
                    .bold()
                CustomTextField(
                    placeholder: "Email",
                    text: $email,
                    highlightColor: .blue,
                    width: 300, isFocused: false
                )
                .autocapitalization(.none)
                .keyboardType(.emailAddress)

                CustomSecureField(
                    placeholder: "Mot de passe",
                    text: $password,
                    highlightColor: .blue,
                    width: 300
                )

                Button("Se connecter") {
                    login()
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 8)

                if !loginError.isEmpty {
                    Text(loginError)
                        .foregroundColor(.red)
                        .font(.caption)
                }

                NavigationLink(destination: UserListView(), isActive: $isLoggedIn) {
                    EmptyView()
                }

                Spacer()
            }
            .padding()
        }
    }

    func login() {
        if let user = MockData.users.first(where: {
            $0.email.lowercased() == email.lowercased() && $0.password == password
        }) {
            currentUser = user
            isLoggedIn = true
        } else {
            loginError = "Email ou mot de passe incorrect."
        }
    }
}

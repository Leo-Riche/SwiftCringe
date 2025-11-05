//
//  LoginView.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 05/11/2025.
//

import SwiftUI
import DesignSystem

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
            NavigationView {
                VStack(spacing: 16) {
                    Text("Connexion")
                        .font(.largeTitle)
                        .bold()

                    CustomTextField(
                        placeholder: "Email",
                        text: $viewModel.email,
                        highlightColor: .blue,
                        width: 300,
                        isFocused: false
                    )
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)

                    CustomSecureField(
                        placeholder: "Mot de passe",
                        text: $viewModel.password,
                        highlightColor: .blue,
                        width: 300
                    )

                    Button("Se connecter") {
                        viewModel.login()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 8)
                    
                    if let error = viewModel.loginError {
                        Text(error.localizedDescription)
                            .foregroundColor(.red)
                            .font(.caption)
                    }

                    NavigationLink(destination: SwipeView(), isActive: $viewModel.isLoggedIn) {
                        EmptyView()
                    }

                    Spacer()
                }
                .padding()
            }
    }
}

#Preview {
    LoginView()
}

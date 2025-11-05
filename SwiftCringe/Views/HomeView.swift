//
//  HomeView.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 05/11/2025.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var session: SessionManager

    var body: some View {
        VStack(spacing: 20) {
            if let user = session.currentUser {
                Text("Bonjour \(user.name) !")
                    .font(.title)
                    .bold()
            } else {
                Text("Bonjour !")
                    .font(.title)
                    .bold()
            }

            Button("Se déconnecter") {
                session.logout()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

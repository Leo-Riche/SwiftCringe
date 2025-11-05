//
//  UserListView.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 05/11/2025.
//

import SwiftUI

struct UserListView: View {
    let users = MockData.users

    var body: some View {
        NavigationView {
            List(users) { user in
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.name)
                        .font(.headline)
                    Text(user.email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Âge : \(user.age)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Utilisateurs")
        }
    }
}

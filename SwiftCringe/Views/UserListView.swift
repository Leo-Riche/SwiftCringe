//
//  UserListView.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 05/11/2025.
//

import SwiftUI
import DesignSystem // ton package contenant UserCard

struct UserListView: View {
    let users = MockData.users

    let columns = [
        GridItem(.adaptive(minimum: 250), spacing: 16)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(users) { user in
                    UserCard(user: UserCard.MockUser(
                        id: user.id,
                        name: user.name,
                        age: user.age,
                        photo: user.photo,
                        description: user.description
                    ))
                }
            }
            .padding()
        }
        .navigationTitle("Utilisateurs")
    }
}

#Preview {
    UserListView()
}

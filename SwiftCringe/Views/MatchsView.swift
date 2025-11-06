//
//  MatchsView.swift
//  SwiftCringe
//
//  Created by CHICHE Raphaël on 06/11/2025.
//
import SwiftUI
import DesignSystem

struct MatchsView: View {
    var session: SessionManager
    
    private var likedUsers: [User] {
        guard let currentUser = session.currentUser else { return [] }
        return MockData.users.filter { currentUser.listLikes.contains($0.id) }
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 160), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    if likedUsers.isEmpty {
                        VStack(spacing: 12) {
                            Image(systemName: "heart.slash")
                                .font(.system(size: 48))
                                .foregroundColor(.gray.opacity(0.6))
                            Text("Aucun like pour le moment 😢")
                                .font(.title3)
                                .foregroundColor(.gray)
                        }
                        .padding(.top, 100)
                    } else {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(likedUsers) { user in
                                MatchCard(
                                    model: .init(
                                        id: user.id,
                                        name: user.name,
                                        description: user.description,
                                        photoURL: user.photo
                                    )
                                )
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Mes matchs ❤️")
        }

    }
}

#Preview {
    MatchsView(session: .init())
}

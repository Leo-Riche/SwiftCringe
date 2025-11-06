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
    
    @State private var likedUsers: [User] = []
    
    let columns = [
        GridItem(.adaptive(minimum: 160), spacing: 16)
    ]
    public init(session: SessionManager, likedUsers: [User]) {
        self.session = session
        self.likedUsers = likedUsers
    }
    
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
                                .foregroundColor(.second.opacity(0.6))
                            Text("Aucun like pour le moment 😢")
                                .font(.title3)
                                .foregroundColor(.second)
                        }
                        .padding(.top, 100)
                    } else {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(likedUsers) { user in
                                MatchCard(
                                    model: .init(
                                        id: user.id,
                                        name: user.name,
                                        age: user.age,
                                        photo: user.photo,
                                        description: user.description,
                                        interests: user.interests
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
        .onAppear  {
                guard let currentUser = session.currentUser else { return  }
                self.likedUsers = MockData.users.filter { currentUser.listLikes.contains($0.id) }
        }
    }
}

#Preview {
    MatchsView(session: .init(), likedUsers: [])
}

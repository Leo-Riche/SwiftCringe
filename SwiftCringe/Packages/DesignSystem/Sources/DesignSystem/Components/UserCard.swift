//
//  UserCard.swift
//  DesignSystem
//
//  Created by RICHÉ Léo on 05/11/2025.
//

import SwiftUI

public struct UserCard: View {
    public struct MockUser: Identifiable {
        public let id: Int
        public let name: String
        public let age: Int
        public let photo: String?
        public let description: String?
        public var interests: [String]

        public init(id: Int, name: String, age: Int, photo: String? = nil, description: String? = nil, interests: [String] = []) {
            self.id = id
            self.name = name
            self.age = age
            self.photo = photo
            self.description = description
            self.interests = interests
        }
    }

    let user: MockUser

    public init(user: MockUser) {
        self.user = user
    }

    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                // --- Background Image (en haut de l’écran) ---
                if let photo = user.photo, let url = URL(string: photo) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: 500)
                            .clipped()
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [.clear, .black.opacity(0.5)]),
                                    startPoint: .center,
                                    endPoint: .bottom
                                )
                            )
                    } placeholder: {
                        Color.gray.opacity(0.3)
                            .frame(height: 500)
                    }
                } else {
                    Color.black.opacity(0.05)
                        .frame(height: 500)
                }

                // --- Scrollable Content ---
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        // Espace pour laisser l'image visible
                        Spacer().frame(height: 400)

                        // Bloc principal
                        VStack(alignment: .leading, spacing: 24) {
                            // Nom + Âge
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text(user.name)
                                        .font(.largeTitle.bold())
                                    Text("· \(user.age)")
                                        .font(.title2)
                                }
                                .foregroundColor(.primary)
                            }

                            Divider()

                            // Description
                            if let desc = user.description {
                                Text(desc)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                    .lineSpacing(5)
                            }

                            // Exemple de champs additionnels (facultatif)
                            if !user.interests.isEmpty {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("Centres d’intérêt")
                                        .font(.headline)
                                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 8) {
                                        ForEach(user.interests, id: \.self) { interest in
                                            Text(interest)
                                                .font(.caption)
                                                .padding(.horizontal, 10)
                                                .padding(.vertical, 6)
                                                .background(Color.blue.opacity(0.15))
                                                .clipShape(Capsule())
                                        }
                                    }
                                }
                            }

                            Spacer(minLength: 60)
                        }
                        .padding(24)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 32)
                                .fill(Color(.systemBackground))
                                .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: -2)
                        )
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
        }
    }
}

#Preview {
    UserCard(user: .init(
        id: 1,
        name: "Alice Dupont",
        age: 25,
        photo: "https://randomuser.me/api/portraits/women/1.jpg",
        description: """
        Passionnée de design et de voyages, Alice adore découvrir de nouvelles cultures et partager ses aventures.
        Elle aime aussi la photo, le café entre amis et les randonnées le week-end.

        Toujours curieuse et pleine d’énergie, elle cherche à rencontrer des gens qui partagent sa passion pour la créativité et la découverte du monde.
        """,
        interests: ["design", "voyages", "photo", "café", "randonnée"]
    ))
}

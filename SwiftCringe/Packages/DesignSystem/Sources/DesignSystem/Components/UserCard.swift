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

        public init(id: Int, name: String, age: Int, photo: String? = nil, description: String? = nil) {
            self.id = id
            self.name = name
            self.age = age
            self.photo = photo
            self.description = description
        }
    }

    let user: MockUser

    public init(user: MockUser) {
        self.user = user
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let photo = user.photo, let url = URL(string: photo) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: .infinity, minHeight: 150)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, minHeight: 150)
                            .clipped()
                    case .failure(_):
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray)
                            .padding(.top, 10)
                    @unknown default:
                        EmptyView()
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))
            } else {
                Image(systemName: "person.crop.square.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.gray)
                    .padding(.top, 10)
            }

            Text(user.name)
                .font(.headline)
            Text("Âge : \(user.age)")
                .font(.subheadline)
                .foregroundColor(.secondary)

            if let desc = user.description {
                Text(desc)
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.top, 4)
            }

            Spacer(minLength: 0)
        }
        .padding()
        .frame(maxWidth: 250, alignment: .leading)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    UserCard(user: .init(
        id: 1,
        name: "Alice Dupont",
        age: 25,
        photo: "https://randomuser.me/api/portraits/women/1.jpg",
        description: "Passionnée de design et de voyages, Alice adore découvrir de nouvelles cultures."
    ))
}


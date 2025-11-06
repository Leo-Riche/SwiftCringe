//
//  MatchCard.swift
//  DesignSystem
//
//  Created by CHICHE Raphaël on 06/11/2025.
//

import SwiftUI

public struct MatchCard: View {
    public struct Model: Identifiable, Equatable {
        public let id: Int
        public let name: String
        public let description: String?
        public let photoURL: String?
        
        public init(id: Int, name: String, description: String? = nil, photoURL: String? = nil) {
            self.id = id
            self.name = name
            self.description = description
            self.photoURL = photoURL
        }
    }
    
    private let model: Model
    
    public init(model: Model) {
        self.model = model
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            // --- Photo du profil ---
            AsyncImage(url: URL(string: model.photoURL ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ZStack {
                    Color.gray.opacity(0.2)
                    Image(systemName: "person.fill")
                        .font(.largeTitle)
                        .foregroundColor(.gray.opacity(0.6))
                }
            }
            .frame(height: 180)
            .clipped()
            .overlay(
                LinearGradient(
                    gradient: Gradient(colors: [.clear, .black.opacity(0.4)]),
                    startPoint: .center,
                    endPoint: .bottom
                )
            )
            .cornerRadius(12, corners: [.topLeft, .topRight])
            
            // --- Texte en dessous ---
            VStack(alignment: .leading, spacing: 4) {
                Text(model.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                if let desc = model.description, !desc.isEmpty {
                    Text(desc)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemBackground))
        }
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

// --- Petite extension utilitaire ---
fileprivate extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

fileprivate struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

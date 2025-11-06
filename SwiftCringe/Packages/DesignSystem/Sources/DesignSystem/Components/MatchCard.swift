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
    
    private let model: Model
    
    public init(model: Model) {
        self.model = model
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: model.photo ?? "")) { image in
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

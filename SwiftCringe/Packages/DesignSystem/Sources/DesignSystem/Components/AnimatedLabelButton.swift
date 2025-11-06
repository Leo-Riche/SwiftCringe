//
//  AnimatedLabelButton.swift
//  DesignSystem
//
//  Created by RICHÉ Léo on 06/11/2025.
//

import SwiftUI

public struct AnimatedLabelButton: View {
    var title: String
    var systemImage: String
    var color: Color = .blue
    var action: () -> Void

    @State private var isPressed = false

    public init(
        title: String,
        systemImage: String,
        color: Color = .blue,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.systemImage = systemImage
        self.color = color
        self.action = action
    }

    public var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.4)) {
                isPressed = true
            }

            action()

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.4)) {
                    isPressed = false
                }
            }
        }) {
            Label(title, systemImage: systemImage)
                .font(.headline)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(10)
                .scaleEffect(isPressed ? 0.9 : 1.0)
                .shadow(radius: isPressed ? 2 : 5)
        }
        .buttonStyle(.plain)
    }
}


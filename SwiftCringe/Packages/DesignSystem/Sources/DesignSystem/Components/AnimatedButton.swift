//
//  Button.swift
//  SwiftUI_Init
//
//  Created by RICHÉ Léo on 04/11/2025.
//

import SwiftUI

public struct AnimatedButton: View {
    var title: String
    var color: Color = .blue
    var action: () -> Void

    @State private var isPressed = false
    
    public init(title: String, color: Color, action: @escaping () -> Void, isPressed: Bool = false) {
        self.title = title
        self.color = color
        self.action = action
        self.isPressed = isPressed
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
            Text(title)
                .bold()
                .padding(.horizontal, 20)
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

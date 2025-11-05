//
//  CustomeSecureField.swift
//  DesignSystem
//
//  Created by RICHÉ Léo on 05/11/2025.
//

import SwiftUI

public struct CustomSecureField: View {
    var placeholder: String
    @Binding var text: String
    var highlightColor: Color = .blue
    var width: CGFloat = 200

    @FocusState private var isFocused: Bool
    @State private var isPasswordVisible: Bool = false

    public init(
        placeholder: String,
        text: Binding<String>,
        highlightColor: Color = .blue,
        width: CGFloat = 200
    ) {
        self.placeholder = placeholder
        self._text = text
        self.highlightColor = highlightColor
        self.width = width
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                if isPasswordVisible {
                    TextField(placeholder, text: $text)
                        .focused($isFocused)
                        .autocapitalization(.none)
                        .textContentType(.password)
                } else {
                    SecureField(placeholder, text: $text)
                        .focused($isFocused)
                        .autocapitalization(.none)
                        .textContentType(.password)
                }

                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(.gray)
                }
                .buttonStyle(.plain)
            }
            .padding(.vertical, 8)
            .animation(.easeInOut, value: isFocused)

            Rectangle()
                .frame(height: 2)
                .foregroundColor(isFocused ? highlightColor : .gray.opacity(0.4))
                .animation(.easeInOut(duration: 0.2), value: isFocused)
        }
        .frame(width: width)
    }
}

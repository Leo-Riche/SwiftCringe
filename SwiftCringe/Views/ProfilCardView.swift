//
//  SwipeView.swift
//  SwiftApp
//
//  Created by CHICHE Raphaël on 05/11/2025.
//

import SwiftUI
import Foundation

struct ProfileCardView: View {
    let profile: User
    @Binding var offset: CGSize
    var onSwipe: (_ direction: SwipeDirection) -> Void

    enum SwipeDirection {
        case left, right, none
    }

    private var swipeDirection: SwipeDirection {
        if offset.width > 0 { return .right }
        if offset.width < 0 { return .left }
        return .none
    }

    var body: some View {
        ZStack(alignment: .bottom) {
//            Image(profile.imageName)
//                .resizable()
//                .scaledToFill()
//                .frame(width: 300, height: 400)
//                .clipped()
//                .cornerRadius(20)
//                .shadow(radius: 5)
//                .overlay(
//                    ZStack {
//                        if swipeDirection == .right {
//                            Text("OUI ❤️")
//                                .font(.largeTitle)
//                                .bold()
//                                .foregroundColor(.green)
//                                .padding()
//                                .rotationEffect(.degrees(-15))
//                                .offset(x: -50, y: -150)
//                        } else if swipeDirection == .left {
//                            Text("NON ❌")
//                                .font(.largeTitle)
//                                .bold()
//                                .foregroundColor(.red)
//                                .padding()
//                                .rotationEffect(.degrees(15))
//                                .offset(x: 50, y: -150)
//                        }
//                    }
//                )

            Text(profile.name)
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black.opacity(0.4))
        }
        .offset(x: offset.width, y: offset.height)
        .rotationEffect(.degrees(Double(offset.width / 20)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { gesture in
                    withAnimation {
                        if abs(gesture.translation.width) > 120 {
                            // Swipe validé
                            let direction: SwipeDirection = gesture.translation.width > 0 ? .right : .left
                            offset.width = gesture.translation.width > 0 ? 500 : -500
                            onSwipe(direction)
                        } else {
                            // Retour à la position d’origine
                            offset = .zero
                        }
                    }
                }
        )
    }
}

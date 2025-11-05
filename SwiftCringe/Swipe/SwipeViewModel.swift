//
//  SwipeViewModel.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 05/11/2025.
//

import SwiftUI

final class SwipeViewModel: ObservableObject {
    @Published var profiles: [User] = MockData.users
    @Published var topCardOffset: CGSize = .zero

    private let session: SessionManager

    init(session: SessionManager) {
        self.session = session
    }

    func handleSwipe(direction: ProfileCardView.SwipeDirection) {
        guard let lastProfile = profiles.last else { return }

        switch direction {
        case .right:
            print("👍 OUI pour \(lastProfile.name)")
        case .left:
            print("👎 NON pour \(lastProfile.name)")
        case .none:
            break
        }

        withAnimation {
            if !profiles.isEmpty {
                profiles.removeLast()
                topCardOffset = .zero
            }
        }
    }
}

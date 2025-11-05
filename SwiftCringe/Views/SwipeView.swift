    //
//  ContentView 2.swift
//  SwiftCringe
//
//  Created by CHICHE Raphaël on 05/11/2025.
//


//
//  ContentView.swift
//  SwiftApp
//
//  Created by CHICHE Raphaël on 03/11/2025.
//

import SwiftUI

struct SwipeView: View {
    @State var profiles = MockData.users
    @State var topCardOffset: CGSize = .zero
    
    var body: some View {
        ZStack {
            ForEach(profiles) { profile in
                if profile.id == profiles.last?.id {
                    ProfileCardView(profile: profile, offset: $topCardOffset) { direction in
                        handleSwipe(direction: direction)
                    }
                                           
                } else {
                }
            }
        }.navigationBarBackButtonHidden(true)
    }

    private func handleSwipe(direction: ProfileCardView.SwipeDirection) {
        // Action selon la direction
        switch direction {
        case .right:
            print("👍 OUI pour \(profiles.last?.name ?? "")")
        case .left:
            print("👎 NON pour \(profiles.last?.name ?? "")")
        case .none:
            break
        }

        // Supprimer le profil swipé
        withAnimation {
            if !profiles.isEmpty {
                profiles.removeLast()
                topCardOffset = .zero
            }
        }
    }
}

#Preview {
    ContentView()
}


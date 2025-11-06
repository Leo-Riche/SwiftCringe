//
//  MainView.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 04/11/2025.
//

import SwiftUI
import DesignSystem

struct MainView: View {
    var session: SessionManager
    @State private var selectedTab: Tab = .home

    enum Tab: Hashable {
        case home, swipe, match, profile
    }

    var body: some View {
        BottomNavBar(
            selectedTab: $selectedTab,
            tabs: [
                TabItem(icon: "house.fill", label: "Accueil", type: .home),
                TabItem(icon: "heart.circle.fill", label: "Swipe", type: .swipe),
                TabItem(icon: "message.circle.fill", label: "Match", type: .match),
                TabItem(icon: "person.crop.circle.fill", label: "Profil", type: .profile)
            ]
        ) { tab in
            switch tab {
            case .home:
                HomeView(session: session, selectedTab: $selectedTab)
                    .background(Color(.systemBackground))
            case .swipe:
                SwipeView(session: session)
                    .background(Color(.systemBackground))
            case .match:
                MatchsView(session: session)
                    .background(Color(.systemBackground))
            case .profile:
                ProfileView(session: session)
                    .background(Color(.systemBackground))
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}



//
//  MainView.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 04/11/2025.
//

import SwiftUI
import DesignSystem

struct MainView: View {
    @ObservedObject var session: SessionManager
    @State private var selectedTab: Tab = .home

    enum Tab {
        case home, swipe, match, profile
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
                    HomeView(session: session, selectedTab: $selectedTab)
                case .swipe:
                    SwipeView(session: session)
                case .match:
                    MatchsView(session: session)
                case .profile:
                    ProfileView(session: session)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))

            BottomNavBar(
                selectedTab: $selectedTab,
                tabs: [
                    TabItem(icon: "house.fill", label: "Accueil", type: .home),
                    TabItem(icon: "heart.circle.fill", label: "Swipe", type: .swipe),
                    TabItem(icon: "message.circle.fill", label: "Match", type: .match),
                    TabItem(icon: "person.crop.circle.fill", label: "Profil", type: .profile)
                ]
            )
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}


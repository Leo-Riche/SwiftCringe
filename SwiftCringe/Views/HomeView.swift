//
//  HomeView.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 05/11/2025.
//

import SwiftUI
import DesignSystem

struct HomeView: View {
    var session: SessionManager
    @Binding var selectedTab: MainView.Tab

    var body: some View {
        VStack(spacing: 20) {
            if let user = session.currentUser {
                if let photoURL = user.photo, let url = URL(string: photoURL) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blue.opacity(0.5), lineWidth: 3))
                            .shadow(radius: 5)
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .frame(width: 120, height: 120)
                        .shadow(radius: 5)
                }

                Text("Bonjour \(user.name) !")
                    .font(.title)
                    .bold()
            }
            
            AnimatedLabelButton(
                title: "Voir mon profil",
                systemImage: "person.crop.circle",
                color: .second
            ) {
                selectedTab = .profile
            }

            AnimatedLabelButton(
                title: "Swiper !",
                systemImage: "heart.fill",
                color: .second
            ) {
                selectedTab = .swipe
            }
            
            AnimatedLabelButton(
                title: "Se déconnecter",
                systemImage: "arrow.right.square",
                color: .second
            ) {
                session.logout()
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Accueil")        
    }    
}


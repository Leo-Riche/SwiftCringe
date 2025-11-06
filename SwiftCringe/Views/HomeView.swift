//
//  HomeView.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 05/11/2025.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var session: SessionManager
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

            Button {
                selectedTab = .profile
            } label: {
                Label("Voir mon profil", systemImage: "person.crop.circle")
                    .font(.headline)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            }
            .buttonStyle(.borderedProminent)

            Button {
                selectedTab = .swipe
            } label: {
                Label("Swiper !", systemImage: "heart.fill")
                    .font(.headline)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            }
            .buttonStyle(.borderedProminent)

            Button {
                session.logout()
            } label: {
                Label("Se déconnecter", systemImage: "arrow.right.square")
                    .font(.headline)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            }
            .buttonStyle(.bordered)

            Spacer()
        }
        .padding()
        .navigationTitle("Accueil")
    }    
}


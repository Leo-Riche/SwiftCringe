    //
//  ContentView 2.swift
//  SwiftCringe
//
//  Created by CHICHE Raphaël on 05/11/2025.
//

import SwiftUI

struct SwipeView: View {
    @ObservedObject var session: SessionManager
    @StateObject private var viewModel: SwipeViewModel

    init(session: SessionManager) {
        self.session = session
        _viewModel = StateObject(wrappedValue: SwipeViewModel(session: session))
    }

    var body: some View {
        ZStack {
            if viewModel.profiles.isEmpty {
                VStack {
                    Text("🎉 Plus de profils disponibles")
                        .font(.title2)
                        .padding()
                    Button("Retour à l’accueil") {
                    }
                    .buttonStyle(.borderedProminent)
                }
            } else {
                ForEach(viewModel.profiles) { profile in
                    if profile.id == viewModel.profiles.last?.id {
                        ProfileCardView(profile: profile, offset: $viewModel.topCardOffset) { direction in
                            viewModel.handleSwipe(direction: direction)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}


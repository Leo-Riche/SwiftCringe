import SwiftUI
import DesignSystem

struct SwipeView: View {
    var session: SessionManager
    @State private var viewModel: SwipeViewModel

    init(session: SessionManager) {
        self.session = session
        _viewModel = State(wrappedValue: SwipeViewModel(session: session))
    }

    var body: some View {
        ZStack {
            // ✅ Fond dégradé doux
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.blue.opacity(0.1),
                    Color.purple.opacity(0.05)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 32) {
                // ✅ Titre
                Text("Découvre des profils ✨")
                    .font(.title2.bold())
                    .foregroundColor(.primary)
                    .padding(.top, 20)

                // ✅ Zone principale (les cartes)
                ZStack {
                    if viewModel.profiles.isEmpty {
                        VStack(spacing: 12) {
                            Image(systemName: "person.crop.circle.badge.exclamationmark")
                                .font(.system(size: 60))
                                .foregroundColor(.gray.opacity(0.6))
                            Text("Plus rien à voir ici 👀")
                                .font(.headline)
                                .foregroundColor(.gray)
                            Text("Reviens plus tard pour découvrir de nouveaux profils.")
                                .font(.subheadline)
                                .foregroundColor(.gray.opacity(0.7))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 40)
                        }
                        .transition(.opacity)
                    } else {
                        ForEach(viewModel.profiles) { profile in
                            if profile.id == viewModel.profiles.last?.id {
                                UserCard(
                                    user: UserCard.MockUser(
                                        id: profile.id,
                                        name: profile.name,
                                        age: profile.age,
                                        photo: profile.photo,
                                        description: profile.description
                                    )
                                )
                                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                                .padding(.horizontal, 20)
                                .offset(x: viewModel.topCardOffset.width, y: 0)
                                .rotationEffect(.degrees(Double(viewModel.topCardOffset.width / 15)))
                                .scaleEffect(1 - abs(viewModel.topCardOffset.width) / 6000)
                                .overlay(
                                    ZStack {
                                        if viewModel.topCardOffset.width > 50 {
                                            Text("OUI ❤️")
                                                .font(.system(size: 36, weight: .bold))
                                                .foregroundColor(.green)
                                                .padding(10)
                                                .background(Color.green.opacity(0.1))
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                .rotationEffect(.degrees(-15))
                                                .offset(x: -60, y: -160)
                                                .opacity(Double(viewModel.topCardOffset.width / 150))
                                        } else if viewModel.topCardOffset.width < -50 {
                                            Text("NON ❌")
                                                .font(.system(size: 36, weight: .bold))
                                                .foregroundColor(.red)
                                                .padding(10)
                                                .background(Color.red.opacity(0.1))
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                .rotationEffect(.degrees(15))
                                                .offset(x: 60, y: -160)
                                                .opacity(Double(-viewModel.topCardOffset.width / 150))
                                        }
                                    }
                                )
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            viewModel.topCardOffset = CGSize(width: value.translation.width, height: 0)
                                        }
                                        .onEnded { value in
                                            let threshold: CGFloat = 120
                                            if viewModel.topCardOffset.width > threshold {
                                                viewModel.swipe(.right)
                                            } else if viewModel.topCardOffset.width < -threshold {
                                                viewModel.swipe(.left)
                                            } else {
                                                withAnimation(.spring()) {
                                                    viewModel.topCardOffset = .zero
                                                }
                                            }
                                        }
                                )
                                .animation(.spring(response: 0.4, dampingFraction: 0.8), value: viewModel.topCardOffset)
                            }
                        }
                    }
                }
                .frame(height: 500)
                .padding(.horizontal, 10)
                .animation(.easeInOut, value: viewModel.profiles)

                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

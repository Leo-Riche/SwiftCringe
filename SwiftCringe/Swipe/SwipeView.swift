import SwiftUI
import DesignSystem

struct SwipeView: View {
    @ObservedObject var session: SessionManager
    @StateObject private var viewModel: SwipeViewModel

    init(session: SessionManager) {
        self.session = session
        _viewModel = StateObject(wrappedValue: SwipeViewModel(session: session))
    }
   
    var body: some View {
        VStack {
            ZStack {
                if viewModel.profiles.isEmpty {
                    Text("Plus rien à voir ici 👀")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    ForEach(viewModel.profiles) { profile in
                        if profile.id == viewModel.profiles.last?.id {
                            UserCard(user: UserCard.MockUser(
                                id: profile.id,
                                name: profile.name,
                                age: profile.age,
                                photo: profile.photo,
                                description: profile.description
                            ))
                            .offset(x: viewModel.topCardOffset.width, y: 0)
                            .rotationEffect(.degrees(Double(viewModel.topCardOffset.width / 15)))
                            .scaleEffect(1 - abs(viewModel.topCardOffset.width) / 5000)
                            .overlay(
                                ZStack {
                                    if viewModel.topCardOffset.width > 50 {
                                        Text("OUI ❤️")
                                            .font(.largeTitle)
                                            .bold()
                                            .foregroundColor(.green)
                                            .padding()
                                            .rotationEffect(.degrees(-15))
                                            .offset(x: -50, y: -150)
                                            .opacity(Double(viewModel.topCardOffset.width / 150))
                                    } else if viewModel.topCardOffset.width < -50 {
                                        Text("NON ❌")
                                            .font(.largeTitle)
                                            .bold()
                                            .foregroundColor(.red)
                                            .padding()
                                            .rotationEffect(.degrees(15))
                                            .offset(x: 50, y: -150)
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
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing: NavigationLink(destination: MatchsView(session: session)) {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .font(.title2)
            })
        }
    }
}


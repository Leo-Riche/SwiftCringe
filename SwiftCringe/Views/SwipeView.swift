import SwiftUI
import DesignSystem

struct SwipeView: View {
    @State var profiles = MockData.users
    @State var topCardOffset: CGSize = .zero
    
    enum SwipeDirection {
        case left, right, none
    }
    
    var body: some View {
        ZStack {
            if profiles.isEmpty{
                Text("Plus rien à voir ici 👀")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                    .padding()
            }
            else{ForEach(profiles) { profile in
                if profile.id == profiles.last?.id {
                    UserCard(user: UserCard.MockUser(
                        id: profile.id,
                        name: profile.name,
                        age: profile.age,
                        photo: profile.photo,
                        description: profile.description
                    ))
                    .offset(x: topCardOffset.width, y: 0)
                    .rotationEffect(.degrees(Double(topCardOffset.width / 15)))
                    .scaleEffect(1 - abs(topCardOffset.width) / 5000)
                    .overlay(
                        ZStack {
                            if topCardOffset.width > 50 {
                                Text("OUI ❤️")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundColor(.green)
                                    .padding()
                                    .rotationEffect(.degrees(-15))
                                    .offset(x: -50, y: -150)
                                    .opacity(Double(topCardOffset.width / 150))
                            } else if topCardOffset.width < -50 {
                                Text("NON ❌")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundColor(.red)
                                    .padding()
                                    .rotationEffect(.degrees(15))
                                    .offset(x: 50, y: -150)
                                    .opacity(Double(-topCardOffset.width / 150))
                            }
                        }
                    )
                    // 🔹 Gestion du geste
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                // 👉 On bloque le mouvement vertical
                                topCardOffset = CGSize(width: value.translation.width, height: 0)
                            }
                            .onEnded { value in
                                let threshold: CGFloat = 120
                                
                                if topCardOffset.width > threshold {
                                    swipe(.right)
                                } else if topCardOffset.width < -threshold {
                                    swipe(.left)
                                } else {
                                    // Retour à la position d’origine
                                    withAnimation(.spring()) {
                                        topCardOffset = .zero
                                    }
                                }
                            }
                    )
                    .animation(.spring(response: 0.4, dampingFraction: 0.8), value: topCardOffset)
                }
            }}
        }
        .navigationBarBackButtonHidden(true)
    }

    // 🔹 Fonction de gestion du swipe
    private func swipe(_ direction: SwipeDirection) {
        // Animation de sortie
        withAnimation(.easeOut(duration: 0.3)) {
            switch direction {
            case .right:
                topCardOffset = CGSize(width: 500, height: 0)
            case .left:
                topCardOffset = CGSize(width: -500, height: 0)
            case .none:
                topCardOffset = .zero
            }
        }
        
        // Suppression du profil après un court délai
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation {
                if !profiles.isEmpty {
                    print(direction == .right
                          ? "👍 OUI pour \(profiles.last?.name ?? "")"
                          : "👎 NON pour \(profiles.last?.name ?? "")")
                    profiles.removeLast()
                    topCardOffset = .zero
                }
            }
        }
    }
}

#Preview {
    SwipeView()
}

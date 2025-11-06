import SwiftUI
import DesignSystem

class SwipeViewModel: ObservableObject {
    @Published var profiles: [User] = MockData.users
    @Published var topCardOffset: CGSize = .zero
    
    @Published var name: String
    @Published var age: String
    @Published var description: String
    @Published var password: String
    @Published var photoURL: String
    @Published var showSaveConfirmation = false
    

    private var session: SessionManager

    var likedNames: [String] {
            guard let currentUser = session.currentUser else { return [] }
            return currentUser.listLikes.compactMap { id in
                MockData.users.first(where: { $0.id == id })?.name
            }
        }
    
    
    enum SwipeDirection {
        case left, right, none
    }
    
    init(session: SessionManager) {
        self.session = session
        if let user = session.currentUser {
            self.name = user.name
            self.age = "\(user.age)"
            self.description = user.description ?? ""
            self.password = user.password
            self.photoURL = user.photo ?? ""
        } else {
            self.name = ""
            self.age = ""
            self.description = ""
            self.password = ""
            self.photoURL = ""
        }
    }
    
    func swipe(_ direction: SwipeDirection) {
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

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation {
                    if !self.profiles.isEmpty {
                        let profile = self.profiles.last!

                        if direction == .right {
                            self.addLike(profileId: profile.id)
                        } else {
                        }

                        self.profiles.removeLast()
                        self.topCardOffset = .zero
                    }
                }
            }
    }
    
    private func addLike(profileId: Int) {
        guard var currentUser = session.currentUser else { return }
        if !currentUser.listLikes.contains(profileId) {
            currentUser.listLikes.append(profileId)
            session.currentUser = currentUser
        }
    }
    
}

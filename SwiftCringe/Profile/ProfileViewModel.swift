//
//  ProfileViewModel.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 05/11/2025.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    @Published var name: String
    @Published var age: String
    @Published var description: String
    @Published var password: String
    @Published var photoURL: String
    @Published var showSaveConfirmation = false

    private var session: SessionManager

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

    func saveChanges() {
        guard let current = session.currentUser else { return }
        let updatedUser = User(
            id: current.id,
            name: name,
            email: current.email,
            age: Int(age) ?? current.age,
            password: password,
            photo: photoURL.isEmpty ? nil : photoURL,
            description: description.isEmpty ? nil :
            description,
            listLikes: current.listLikes
        )
        
        session.currentUser = updatedUser
        session.login(user: updatedUser)
        showSaveConfirmation = true
    }
}

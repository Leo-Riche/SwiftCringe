//
//  User.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 05/11/2025.
//

struct MockData {
    static let users: [User] = [
        User(id: 1, name: "Alice Dupont", email: "alice.dupont@example.com", age: 25, password: "alice123", photo: "https://randomuser.me/api/portraits/women/1.jpg", description: "Passionnée de design et de voyages, Alice adore découvrir de nouvelles cultures."),
        User(id: 2, name: "Bruno Martin", email: "bruno.martin@example.com", age: 30, password: "bruno456", photo: "https://randomuser.me/api/portraits/men/2.jpg", description: "Développeur backend amateur de café et de randonnées."),
        User(id: 3, name: "Claire Rousseau", email: "claire.rousseau@example.com", age: 27, password: "claire789", photo: "https://randomuser.me/api/portraits/women/3.jpg", description: nil),
        User(id: 4, name: "David Lefèvre", email: "david.lefevre@example.com", age: 35, password: "david000", photo: nil, description: "Chef de projet expérimenté, amateur de cinéma et de jeux vidéo."),
        User(id: 5, name: "Emma Petit", email: "emma.petit@example.com", age: 22, password: "emma123", photo: "https://randomuser.me/api/portraits/women/4.jpg", description: "Étudiante en marketing digital, toujours à la recherche d’inspiration.")
    ]
}

//
//  User.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 05/11/2025.
//

import SwiftUI

struct User: Identifiable, Codable, Equatable {
    let id: Int
    let name: String
    let email: String
    let age: Int
    let password: String
    let photo: String?
    let description: String?
    var listLikes: [Int]
}

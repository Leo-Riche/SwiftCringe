//
//  LoginError.swift
//  SwiftCringe
//
//  Created by RICHÉ Léo on 05/11/2025.
//

import Foundation

public enum LoginValidationError: LocalizedError, Equatable {
    case emptyEmail
    case emailNotFound
    case emptyPassword
    case incorrectPassword

    public var errorDescription: String? {
        switch self {
        case .emptyEmail:
            return "L’email ne peut pas être vide."
        case .emailNotFound:
            return "Cet email n’est pas attribué à un compte."
        case .emptyPassword:
            return "Le mot de passe ne peut pas être vide."
        case .incorrectPassword:
            return "Mot de passe incorrect."
        }
    }
}

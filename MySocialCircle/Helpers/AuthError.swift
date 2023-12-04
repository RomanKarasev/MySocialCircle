//
//  AuthError.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 03.12.2023.
//

import Foundation

enum AuthError {
    case notFilled
    case ivalidEmail
    case passwordsNotMatched
    case unknownError
    case serverError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
            
        case .notFilled:
            return NSLocalizedString("Fields are not filled", comment: "")
        case .ivalidEmail:
            return NSLocalizedString("Mail format is incorrect", comment: "")
        case .passwordsNotMatched:
            return NSLocalizedString("Passwords mismatch", comment: "")
        case .unknownError:
            return NSLocalizedString("Unknown error", comment: "")
        case .serverError:
            return NSLocalizedString("Server error", comment: "")
        }
    }
}

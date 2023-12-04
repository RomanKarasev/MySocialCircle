//
//  UserError.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 03.12.2023.
//

import Foundation

enum UserError {
    case notFilled
    case photoNotExist
    case cannotUnwrapToMuser
    case cannotGetUserInfo
    
}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
            
        case .notFilled:
            return NSLocalizedString("Fields are not filled", comment: "")
        case .photoNotExist:
            return NSLocalizedString("The user did not select a photo", comment: "")
        case .cannotGetUserInfo:
            return NSLocalizedString("Unable to load information", comment: "")
        case .cannotUnwrapToMuser:
            return NSLocalizedString("Impossible to convert", comment: "")
        }
    }
}

//
//  AuthNavigationDelegate.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 03.12.2023.
//

import Foundation

protocol AuthNavigationDelegate: AnyObject {
    func toLoginVC()
    func toSignUpVC()
}

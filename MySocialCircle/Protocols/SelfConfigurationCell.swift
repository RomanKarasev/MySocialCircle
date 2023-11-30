//
//  SelfConfigurationCell.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 30.11.2023.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(with value: MChat)
}

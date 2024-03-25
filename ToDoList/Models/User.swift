//
//  User.swift
//  ToDoList
//
//  Created by Chingiz on 24.03.24.
//

import Foundation

struct User: Codable {
    let id: String
    let username: String
    let email: String
    let joinDate: TimeInterval
}

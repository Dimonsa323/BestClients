//
//  File.swift
//  BestClients
//
//  Created by Дима Губеня on 14.09.2022.
//

import Foundation

struct UserInfo {
    let name: String
    let surname: String
    let userID: UUID
    let ageInfo: String
    let genderInfo: String

    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
        self.userID = UUID()
    }

    init(user: User) {
        self.name = user.name ?? ""
        self.surname = user.surname ?? ""
        self.userID = user.id
    }
}

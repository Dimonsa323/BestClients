//
//  DetailInfo.swift
//  BestClients
//
//  Created by Дима Губеня on 16.09.2022.
//

import Foundation

struct DetailInfo {
    var nameInfo: String
    var ageInfo: String
    var genderInfo: String

    init(model: UserInfo) {
        self.nameInfo = model.name
        self.ageInfo = model.ageInfo
        self.genderInfo = model.genderInfo
    }
}

//
//  AddingNewUserPresenter.swift
//  BestClients
//
//  Created by Дима Губеня on 17.09.2022.
//

import Foundation

protocol AddingNewUserPresenterProtocol {
    func showAddVC()
}

class AddingNewUserPresenter: AddingNewUserPresenterProtocol {
    
    private let navigator: NavigatorProtocol
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
}

extension AddingNewUserPresenter {
    func showAddVC() {
        <#code#>
    }
}

//
//  DetailInfoUsersPresenter.swift
//  BestClients
//
//  Created by Дима Губеня on 14.09.2022.
//

import Foundation
import UIKit

    // MARK: Protocol Presenter

protocol DetailInfoUsersPresenterProtocol {
    var model: DetailInfo { get }
    
    func showCreateUsers(vc: UIViewController)
}

    // MARK: - Presenter

class DetailInfoUsersPresenter: DetailInfoUsersPresenterProtocol {
    var model: DetailInfo
    
    private let navigator: NavigatorProtocol
    private let coreDataStore: CoreDataStoreProtocol
    
    init(navigator: NavigatorProtocol, coreDataStore: CoreDataStoreProtocol, model: DetailInfo) {
        self.navigator = navigator
        self.coreDataStore = coreDataStore
        self.model = model 
    }
}

extension DetailInfoUsersPresenter {
    func showCreateUsers(vc: UIViewController) {
        navigator.showAddingInfo(view: vc)
    }
}



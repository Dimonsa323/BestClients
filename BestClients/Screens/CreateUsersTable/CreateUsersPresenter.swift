//
//  CreateUsersPresenter.swift
//  BestClients
//
//  Created by Дима Губеня on 14.09.2022.
//

import Foundation
import UIKit

    // MARK: - CreateUsersPresenterProtocol

protocol CreateUsersPresenterProtocol {
    var users: [UserInfo] { get }
    
    func saveUserInDatabase(user: UserInfo, closure: Closure)
    func fetchRequest(closure: Closure)
    func deleteUser(indexPath: IndexPath, closure: Closure)
    func updateUser(indexPath: IndexPath, localUser: UserInfo, closure: Closure)
    func showNextScreen(vc: UIViewController, indexPath: IndexPath)
}

// MARK: - CreateUsersPresenter

class CreateUsersPresenter: CreateUsersPresenterProtocol {
    
    // MARK: - Properties
    
    var users: [UserInfo] = []
    var detailUsers: [DetailInfo] = []
    
    private let coreDataStore: CoreDataStoreProtocol
    private let navigator: NavigatorProtocol
    
    // MARK: - Init
    
    init(coreDataStore: CoreDataStoreProtocol, navigator: NavigatorProtocol) {
        self.navigator = navigator
        self.coreDataStore = coreDataStore
    }
    
    // MARK: - Method
    
    func saveUserInDatabase(user: UserInfo, closure: Closure) {
        self.users.append(user)
        
        let newUser = User(context: coreDataStore.context)
        
        newUser.name = user.name
        newUser.surname = user.surname
        newUser.id = user.userID
        
        print(newUser.id)
        
        coreDataStore.saveContext()
        closure()
    }
    
    func fetchRequest(closure: Closure) {
        users = coreDataStore.fetchRequest()
        closure()
    }
    
    func deleteUser(indexPath: IndexPath, closure: Closure) {
        coreDataStore.deleteUsers(id: users[indexPath.row].userID)
        users.remove(at: indexPath.row)
        closure()
    }
    
    func updateUser(indexPath: IndexPath, localUser: UserInfo, closure: Closure) {
        coreDataStore.updateUser(localUser: localUser)
        users[indexPath.row] = localUser
        closure()
    }
    
    func showNextScreen(vc: UIViewController, indexPath: IndexPath) {
        let model = users[indexPath.row]
        let detailInfo = DetailInfo(model: model)
        navigator.showDetailInfo(view: vc, navigator: navigator, model: detailInfo)
    }
}



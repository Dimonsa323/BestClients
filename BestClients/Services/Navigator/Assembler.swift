//
//  Assembler.swift
//  BestClients
//
//  Created by Дима Губеня on 14.09.2022.
//

import Foundation
import UIKit

class Assembler {
    
    private let coreDataStore = CoreDataStore()

    func createStartVC(navigator: NavigatorProtocol) -> UIViewController {
        let presenter = CreateUsersPresenter(coreDataStore: coreDataStore, navigator: navigator )
        let vc = CreateUsersVC(presenter: presenter)

        return vc
    }
    
    func detailNewUser(navigator: NavigatorProtocol, model: DetailInfo) -> UIViewController {
        let presenter = DetailInfoUsersPresenter(navigator: navigator, coreDataStore: coreDataStore, model: model)
        let vc = DetailInfoUsersVC(presenter: presenter)
        
        return vc
    }
    
    func showTextField(view: UIViewController, navigator: NavigatorProtocol) -> UIViewController {
        let presenter = AddingNewUserPresenter(navigator: navigator)
        let vc = AddingNewUserVC(presenter: presenter)
        
        return vc
    }
}





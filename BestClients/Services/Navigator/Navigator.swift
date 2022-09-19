//
//  Navigator.swift
//  BestClients
//
//  Created by Дима Губеня on 14.09.2022.
//

import Foundation
import UIKit

protocol NavigatorProtocol {
    func showDetailInfo(view: UIViewController, navigator: NavigatorProtocol, model: DetailInfo)
    func showAddingInfo(view: UIViewController)
}

class Navigator: NavigatorProtocol {
    
    private let assembler = Assembler()

    func showFirstScreen() -> UIViewController {
        let vc = assembler.createStartVC(navigator: self)
        return vc
    }
    
    func showDetailInfo(view: UIViewController, navigator: NavigatorProtocol, model: DetailInfo) {
        let vc = assembler.detailNewUser(navigator: self, model: model)
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showAddingInfo(view: UIViewController) {
        let vc = assembler.showTextField(view: view, navigator: self)
        view.navigationController?.pushViewController(vc, animated: true)
    }
}

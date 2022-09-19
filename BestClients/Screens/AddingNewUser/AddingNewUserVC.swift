//
//  AddingNewUserVC.swift
//  BestClients
//
//  Created by Дима Губеня on 14.09.2022.
//

import UIKit

class AddingNewUserVC: UIViewController {

    private let presenter: AddingNewUserPresenterProtocol
    
    init(presenter: AddingNewUserPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createAlert(title: "Create", message: "Add New User", textFirstTextField: "Alexey", textSecondTextField: "37", textThreeTextField: "Male") { name, age, gender in
            <#code#>
        }
    }

}

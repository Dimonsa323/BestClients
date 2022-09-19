//
//  DetailInfoUsersVC.swift
//  BestClients
//
//  Created by Дима Губеня on 14.09.2022.
//

import UIKit

    // MARK: - DetailInfoUsersVC

class DetailInfoUsersVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    // MARK: - Properties
    
    private let presenter: DetailInfoUsersPresenterProtocol
    
    // MARK: - Init
    
    init(presenter: DetailInfoUsersPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationController()
    }
}

    // MARK: - Private Extension

extension DetailInfoUsersVC {
    func setupUI() {
        nameLabel.text = presenter.model.nameInfo
        ageLabel.text = presenter.model.ageInfo
        genderLabel.text = presenter.model.genderInfo
    }
    
    func setupNavigationController() {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createUser))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc
    private func createUser() {
        presenter.showCreateUsers(vc: self)
            }
        }
    


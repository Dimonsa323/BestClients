//
//  CreateUsersVC.swift
//  BestClients
//
//  Created by Дима Губеня on 14.09.2022.
//

import UIKit

    // MARK: - CreateUsersVC

class CreateUsersVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private let setupCell = String(describing: CreateUsersCell.self)
    private let presenter: CreateUsersPresenterProtocol
    
    // MARK: - Init
    
    init(presenter: CreateUsersPresenterProtocol) {
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
        presenter.fetchRequest {
            self.tableView.reloadData()
        }
    }
}

// MARK: - Private Extension

private extension CreateUsersVC {
    func setupUI() {
        setupTableView()
        setupNavigationController()
    }
    
    func setupNavigationController() {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createUser))
        navigationItem.rightBarButtonItem = button
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: setupCell, bundle: nil), forCellReuseIdentifier: setupCell)
    }
    
    @objc
    private func createUser() {
        createAlert(title: "Create", message: "Enter new user") { name, surname in
            let userLocal = UserInfo(name: name, surname: surname)
            self.presenter.saveUserInDatabase(user: userLocal) {
                self.tableView.insertRows(at: [IndexPath(row: self.presenter.users.count - 1, section: 0)], with: .automatic)
            }
        }
    }
}

extension CreateUsersVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showNextScreen(vc: self, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: setupCell, for: indexPath) as! CreateUsersCell
        let user = presenter.users[indexPath.row]
        cell.config(with: user)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Edit") { _, _, complete in
            let user = self.presenter.users[indexPath.row]
            
            self.createAlert(
                title: "Update",
                message: "Update user info",
                textFirstTextField: user.name,
                textSecondTextField: user.surname
            ) { name, surname in
                let userLocal = UserInfo(name: name, surname: surname)
                self.presenter.updateUser(indexPath: indexPath, localUser: userLocal) {
                    self.tableView.reloadRows(at: [indexPath], with: .automatic)
                }
            }
            complete(true)
        }
        
        editAction.image = UIImage(systemName: "slider.horizontal.3")!
        editAction.backgroundColor = .systemGreen
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
            self.presenter.deleteUser(indexPath: indexPath) {
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            complete(true)
        }
        
        deleteAction.image = UIImage(systemName: "trash")!
        deleteAction.backgroundColor = .systemRed
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        configuration.performsFirstActionWithFullSwipe = true
        
        return configuration
    }
}

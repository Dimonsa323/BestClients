//
//  CreateUsersCell.swift
//  BestClients
//
//  Created by Дима Губеня on 14.09.2022.
//

import UIKit

    // MARK: - CreateUsersCell

class CreateUsersCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func config(with model: UserInfo) {
        nameLabel.text = model.name
        surnameLabel.text = model.surname 
    }
}


//
//  Extension+Alert.swift
//  BestClients
//
//  Created by Дима Губеня on 15.09.2022.
//

import Foundation
import UIKit

typealias Closure = () -> ()
typealias ClosureOne<T> = (T) -> ()
typealias ClosureTwo<T,K> = (T, K) -> ()
typealias ClosureThree<T,K,L> = (T, K, L) -> ()

extension UIViewController {
    func createAlert(
        title: String = "",
        message: String = "",
        textFirstTextField: String = "",
        textSecondTextField: String = "",
        textThreeTextField: String = "",
        closure: @escaping ClosureTwo<String, String, String>
    ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alertController.addTextField { textField in
            textField.placeholder = "Enter Second Name"
            textField.text = textFirstTextField
        }

        alertController.addTextField { textField in
            textField.placeholder = "Enter First Name"
            textField.text = textSecondTextField
        }

        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            let firstTextFieldText = (alertController.textFields![0] as UITextField).text ?? ""
            let secondTextFieldText = (alertController.textFields![1] as UITextField).text ?? ""
            closure(firstTextFieldText, secondTextFieldText)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil )

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)
    }
}

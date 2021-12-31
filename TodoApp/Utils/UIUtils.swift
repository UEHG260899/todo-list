//
//  UIUtils.swift
//  TodoApp
//
//  Created by Uriel Hernandez Gonzalez on 30/12/21.
//

import UIKit

enum AlertType {
    case success, error
}

class UIUtils {
    
    static func showAlert(tile: String, message: String, type: AlertType, controller: UIViewController) -> UIAlertController {
        
        let alert = UIAlertController(title: tile, message: message, preferredStyle: .alert)
        
        switch type {
        case .success:
            let accept = UIAlertAction(title: "Accept", style: .default) { action in
                controller.navigationController?.popViewController(animated: true)
            }
            alert.addAction(accept)
        case .error:
            let accept = UIAlertAction(title: "Accept", style: .default)
            alert.addAction(accept)
        }
        
        return alert
    }
    
}

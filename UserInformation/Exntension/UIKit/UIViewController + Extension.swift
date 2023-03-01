//
//  UIViewController + Extension.swift
//  UserInformation
//
//  Created by Сергей Анпилогов on 01.03.2023.
//

import UIKit

extension UIViewController {
    
    func presentSimpleAlert(title: String, message: String?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func presentChangeAlert(completionHangler: @escaping (Bool) -> Void) {
        
        
        let alertController = UIAlertController(title: "The data was changed", message: "You want to save changes, otherwise the amendments made will be changed", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            completionHangler(true)
        }
        
        let skipAction = UIAlertAction(title: "Skip", style: .default) { _ in
            completionHangler(false)
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(skipAction)
        present(alertController, animated: true)
    }
}

//
//  UIBarButtonItem + Extension.swift
//  UserInformation
//
//  Created by Сергей Анпилогов on 01.03.2023.
//

import UIKit

extension UIBarButtonItem {
    
    static func createCustomButton(vc: UIViewController, selector: Selector) -> UIBarButtonItem {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "left-chevron")?.withRenderingMode(.alwaysTemplate),
                        for: .normal)
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.tintColor = .systemBlue
        button.addTarget(vc, action: selector, for: .touchUpInside)
        
        
        if #available(iOS 15.0, *) {
            var configure = UIButton.Configuration.plain()
            configure.imagePadding = 7
            configure.contentInsets = .init(top: 0, leading: -7, bottom: 0, trailing: 0)
            button.configuration = configure
        } else {
            button.titleEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: -10)
        }
        
        let barItem = UIBarButtonItem(customView: button)
        return barItem
    }
}

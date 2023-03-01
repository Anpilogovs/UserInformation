//
//  GenderTextField.swift
//  UserInformation
//
//  Created by Сергей Анпилогов on 28.02.2023.
//

import Foundation
import UIKit

class GenderTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        placeholder = "Enter the data"
        textAlignment = .right
        tintColor = .clear
        font = Recoursec.Fonts.avenirNextRegular(with: 18)
        let font = Recoursec.Fonts.avenirNextRegular(with: 18)
        attributedPlaceholder = NSAttributedString(string: "Enter the data", attributes: [.foregroundColor : UIColor.lightGray, .font : font as Any])
    }
//    Due to this method, it cannot shift the courses in the textField
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        !isFirstResponder
    }
}

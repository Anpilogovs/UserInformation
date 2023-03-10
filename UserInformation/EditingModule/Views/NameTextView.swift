//
//  MainTextView.swift
//  UserInformation
//
//  Created by Сергей Анпилогов on 28.02.2023.
//

import UIKit

class NameTextView: UITextView {
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        text = "Enter the data"
        textColor = .lightGray
        textAlignment = .right
        isScrollEnabled = false
        font = Resoursec.Fonts.avenirNextRegular(with: 18)
    }
}

//
//  Recoursec.swift
//  UserInformation
//
//  Created by Сергей Анпилогов on 27.02.2023.
//

import UIKit

enum Resoursec {
    
    enum NameFields: String, CaseIterable {
        case firstName = "Name"
        case secondName = "Last name"
        case thirdName = "Surname"
        case birthDay = "Birthday"
        case gender = "Gender"
    }
    
    enum Ganger: String, CaseIterable {
        case noSpecified = "Not pointed"
        case man = "male"
        case woman = "female"
    }
    
    enum Fonts {
        static func avenirNextRegular(with size: CGFloat) -> UIFont? {
            UIFont(name: "Avenir Next", size: size)
        }
    }
}

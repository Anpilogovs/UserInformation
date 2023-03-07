//
//  UserModel.swift
//  UserInformation
//
//  Created by Сергей Анпилогов on 01.03.2023.
//

import Foundation

struct UserModel {
    var firstName = ""
    var secondName = ""
    var thirdName = ""
    var birthDay = ""
    var gender = ""
    
//    Comparison of the structure
    static func == (_ firstModel: UserModel, _ secondModel: UserModel) -> Bool {
        firstModel.firstName == secondModel.firstName &&
        firstModel.secondName == secondModel.secondName &&
        firstModel.thirdName == secondModel.thirdName &&
        firstModel.birthDay == secondModel.birthDay &&
        firstModel.gender == secondModel.gender
    }
}

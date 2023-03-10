//
//  UserDefaultsHelper.swift
//  UserInformation
//
//  Created by Сергей Анпилогов on 01.03.2023.
//

import Foundation

final class UserDefaultsHelper {
    
    private static let defaults = UserDefaults.standard
    private static let userSessionKey = "userKey"
    
    static func getUserDictionary() -> [String : String] {
        defaults.value(forKey: userSessionKey) as? [String : String] ?? [:]
    }
    
    static func saveUserValue(_ key: String, value: String) {
        var userDictionary = getUserDictionary()
        userDictionary[key] = value
        defaults.set(userDictionary, forKey: userSessionKey)
    }
    
    static func getUserModel() -> UserModel {
        var userModel = UserModel()
        
        let userDictionary = getUserDictionary()
        userModel.firstName = userDictionary[Resoursec.NameFields.firstName.rawValue] ?? ""
        userModel.secondName = userDictionary[Resoursec.NameFields.secondName.rawValue] ?? ""
        userModel.thirdName = userDictionary[Resoursec.NameFields.thirdName.rawValue] ?? ""
        userModel.birthDay = userDictionary[Resoursec.NameFields.birthDay.rawValue] ?? ""
        userModel.gender = userDictionary[Resoursec.NameFields.gender.rawValue] ?? ""
        
        return userModel
    }
    
    static func getUserValue(_ key: String) -> String {
        
        let userDictionary = getUserDictionary()
        let stringValue = userDictionary[key] ?? ""
        
        return stringValue
    }
}

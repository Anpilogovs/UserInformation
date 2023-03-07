//
//  EditingTableView.swift
//  UserInformation
//
//  Created by Сергей Анпилогов on 01.03.2023.
//

import Foundation
import UIKit


final class EditingTableView: UITableView {
    
    private var userModel = UserModel()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        //        register(TextViewTableViewCell.self.self, forCellReuseIdentifier: TextViewTableViewCell.idTextViewCell)
        
        register(TextViewTableViewCell.self)
        register(DatePickerTableViewCell.self)
        register(PickerViewTableViewCell.self)
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUserModel(_ model: UserModel) {
        userModel = model
    }
    
    public func editUserModel() {
        
        guard let firstNameCell = self.cellForRow(at: [0,0]) as? TextViewTableViewCell,
              let secondNameCell = self.cellForRow(at: [0,2]) as? TextViewTableViewCell,
              let thirdNameCell = self.cellForRow(at: [0,2]) as? TextViewTableViewCell,
              let birthsdayCell = self.cellForRow(at: [0,3]) as? DatePickerTableViewCell,
              let genderCell = self.cellForRow(at: [0,4]) as? PickerViewTableViewCell else {
            return
        }
        
        userModel.thirdName = firstNameCell.getCellValue()
        userModel.secondName = secondNameCell.getCellValue()
        userModel.thirdName = thirdNameCell.getCellValue()
        userModel.birthDay = birthsdayCell.getCellValue()
        userModel.gender = genderCell.getCellValue()
    }
    
    public func getUserModel() -> UserModel {
        editUserModel()
        return userModel
    }
}

//MARK: - UITableViewController

extension EditingTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Recoursec.NameFields.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nameFiled = Recoursec.NameFields.allCases[indexPath.row].rawValue
        
        switch indexPath.row {
        case 0...2:
            guard let cell = self.dequeueReusableCell(TextViewTableViewCell.self) else {
                return UITableViewCell()
            }
            
            cell.nameTextViewDelegate = self
            
            switch indexPath.row {
            case 0: cell.configure(name: nameFiled, scrollEnable: true, value: userModel.firstName)
            case 1: cell.configure(name: nameFiled, scrollEnable: false, value: userModel.secondName)
            default:
                cell.configure(name: nameFiled, scrollEnable: true, value: userModel.thirdName)
            }
            return cell
        case 3:
            guard let cell = self.dequeueReusableCell(DatePickerTableViewCell.self) else {
                return UITableViewCell()
            }
            cell.configure(name: nameFiled, date: userModel.birthDay.getDateFromString())
            return cell
        case 4:
            guard let cell = self.dequeueReusableCell(PickerViewTableViewCell.self) else {
                return UITableViewCell()
            }
            cell.configure(name: nameFiled, value: userModel.gender)
            return cell
        default:
            return  UITableViewCell()
        }
    }
}

//MARK: - UITableViewDelegate

extension EditingTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

extension EditingTableView: NameTextViewProtocol {
    func changeSize() {
        beginUpdates()
        endUpdates()
    }
}

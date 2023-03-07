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
            if indexPath.row == 1 {
                cell.configure(name: nameFiled, scrollEnable: false)
            } else {
                cell.configure(name: nameFiled, scrollEnable: true)
            }
            return cell
            
        case 3:
            guard let cell = self.dequeueReusableCell(DatePickerTableViewCell.self) else {
                return UITableViewCell()
            }
            cell.configure(name: nameFiled)
            return cell
        case 4:
            guard let cell = self.dequeueReusableCell(PickerViewTableViewCell.self) else {
                return UITableViewCell()
                
            }
            cell.configure(name: nameFiled)
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

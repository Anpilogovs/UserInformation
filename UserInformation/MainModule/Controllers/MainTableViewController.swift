//
//  ViewController.swift
//  UserInformation
//
//  Created by Сергей Анпилогов on 27.02.2023.
//

import UIKit

final class MainTableViewController: UITableViewController {
    
    private var userModel = UserModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        getUserModel()
        //        tableView.register(MainTableViewCell.self,
        //                          forCellReuseIdentifier: MainTableViewCell.idMainTableViewCell)
        tableView.register(MainTableViewCell.self)
    }
    
    private func setupViews() {
        title = "View"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(editingTapped))
    }
    
    @objc private func editingTapped() {
        let editinViewController = EditingViewController(userModel)
        navigationItem.backButtonTitle = "Back"
        navigationController?.pushViewController(editinViewController, animated: true)
    }
    
    private func getUserModel() {
        userModel = UserDefaultsHelper.getUserModel()
    }
    
    private func saveEditModel(_ model: UserModel) {
        UserDefaultsHelper.saveUserValue(Resoursec.NameFields.firstName.rawValue, value: model.firstName)
        UserDefaultsHelper.saveUserValue(Resoursec.NameFields.secondName.rawValue, value: model.secondName)
        UserDefaultsHelper.saveUserValue(Resoursec.NameFields.thirdName.rawValue, value: model.thirdName)
        UserDefaultsHelper.saveUserValue(Resoursec.NameFields.birthDay.rawValue, value: model.birthDay)
        UserDefaultsHelper.saveUserValue(Resoursec.NameFields.gender.rawValue, value: model.gender)
    }
    
    public func changeUserModel(model: UserModel) {
       //Save model
        saveEditModel(model)
        //RefreshLabel
        userModel = model
        tableView.reloadData()
    }
}
//MARK: - UITableViewController

extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Resoursec.NameFields.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.idMainTableViewCell , for: indexPath) as? MainTableViewCell else {
        guard let cell = tableView.dequeueReusableCell(MainTableViewCell.self) else {
            return UITableViewCell()
        }
        
        let nameFiled = Resoursec.NameFields.allCases[indexPath.row].rawValue
        let value = UserDefaultsHelper.getUserValue(Resoursec.NameFields.allCases[indexPath.row].rawValue)
        cell.configure(name: nameFiled, value: value)
        return cell
    }
}

//MARK: - UITableViewDelegate

extension MainTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}


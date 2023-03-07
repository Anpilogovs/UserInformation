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
        //                           forCellReuseIdentifier: MainTableViewCell.idMainTableViewCell)
        
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
}
//MARK: - UITableViewController

extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Recoursec.NameFields.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.idMainTableViewCell , for: indexPath) as? MainTableViewCell else {
        guard let cell = tableView.dequeueReusableCell(MainTableViewCell.self) else {
            return UITableViewCell()
        }
        
        let nameFiled = Recoursec.NameFields.allCases[indexPath.row].rawValue
        let value = UserDefaultsHelper.getUserValue(Recoursec.NameFields.allCases[indexPath.row].rawValue)
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


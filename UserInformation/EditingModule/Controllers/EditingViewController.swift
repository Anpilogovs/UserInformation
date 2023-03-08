//
//  EditingViewController.swift
//  UserInformation
//
//  Created by Сергей Анпилогов on 27.02.2023.
//


import UIKit

final class EditingViewController: UIViewController {
    
    private let editingTableView = EditingTableView()
    
    private var userModel = UserModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    init(_ userModel: UserModel) {
        self.userModel = userModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        title = "Editing"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(saveTapped))
        let backBarButtonItem = UIBarButtonItem.createCustomButton(vc: self, selector: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backBarButtonItem
        editingTableView.setUserModel(userModel)
        view.addView(editingTableView)
    }
    
    @objc private func saveTapped() {
        
        let editUserModel = editingTableView.getUserModel()
        
        if authFields(model: editUserModel) {
            presentSimpleAlert(title: "done", message: "Fill all the obligatory fields")
        } else {
            presentSimpleAlert(title: "Erro", message: "fill in the fields Full Name")
        }
    }
    
    @objc private func backButtonTapped() {
        
        let editUserModel = editingTableView.getUserModel()
        
        if editUserModel == userModel {
            navigationController?.popViewController(animated: true)
        } else {
            presentChangeAlert { [weak self] value in
                guard let self = self else { return }
                //Model
                if value {
                    guard let firstVC = self.navigationController?.viewControllers.first as? MainTableViewController else { return
                    }
                    firstVC.changeUserModel(model: editUserModel)
                    self.navigationController?.popViewController(animated: true)
                } else {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    private func authFields(model: UserModel) -> Bool {
        if model.firstName == "Enter the data" ||
            model.secondName == "Enter the data" ||
            model.birthDay == "" ||
            model.gender == "" ||
            model.gender == "Not pointed" {
            return false
        }
        return true
    }
}

//MARK: - Set Constraints

extension EditingViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            editingTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            editingTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            editingTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            editingTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}


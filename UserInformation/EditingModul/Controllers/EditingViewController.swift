//
//  EditingViewController.swift
//  UserInformation
//
//  Created by Сергей Анпилогов on 27.02.2023.
//


import UIKit

final class EditingViewController: UIViewController {
    
    private let editingTableView = EditingTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
  
    }
    
    private func setupViews() {
        title = "Editing"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(editingTapped))
        view.addView(editingTableView)
    }
    
    @objc private func editingTapped() {
        print("tap")
    }
}


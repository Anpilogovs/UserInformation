//
//  EditingViewController.swift
//  UserInformation
//
//  Created by Сергей Анпилогов on 27.02.2023.
//

import Foundation
import UIKit

class EditingTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.idMainTableViewCell)
    }
    
    private func setupViews() {
        title = "View"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(editingTapped))
    }
    
    @objc private func editingTapped() {
        print("tap")
    }
}

//MARK: - UITableViewController

extension EditingTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Recoursec.NameFields.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.idMainTableViewCell , for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        
        let nameFiled = Recoursec.NameFields.allCases[indexPath.row].rawValue
        cell.configure(name: nameFiled)
        return cell
    }
}

//MARK: - UITableViewDelegate

extension EditingTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}


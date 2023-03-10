//
//  MainTableViewCell.swift
//  UserInformation
//
//  Created by Сергей Анпилогов on 27.02.2023.
//

import Foundation
import UIKit

class MainTableViewCell: UITableViewCell {
    
    private let nameLabel = UILabel()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = "Test"
        label.font = Resoursec.Fonts.avenirNextRegular(with: 18)
        label.numberOfLines = 0
        return label
    }()
    
    static var idMainTableViewCell = "idMainTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func setupViews() {
        selectionStyle = .none
        
        nameLabel.font = Resoursec.Fonts.avenirNextRegular(with: 18)
        
        addView(nameLabel)
        addView(valueLabel)
    }
    
    public func configure(name: String, value: String) {
        nameLabel.text = name
        valueLabel.text = value == "" ? "No data" : value
        
    }
}

extension MainTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            heightAnchor.constraint(greaterThanOrEqualToConstant: 44),
            
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            
            valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            valueLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
}

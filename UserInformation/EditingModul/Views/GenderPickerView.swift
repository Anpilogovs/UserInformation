//
//  GenderPickerView.swift
//  UserInformation
//
//  Created by Сергей Анпилогов on 28.02.2023.
//

import Foundation
import UIKit

protocol GenderPickerViewProtocol: AnyObject {
    func didSelect(row: Int)
}

class GenderPickerView: UIPickerView {
    
    
    weak var genderDelegate: GenderPickerViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GenderPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
     return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Recoursec.Ganger.allCases.count
    }
}

extension GenderPickerView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        Recoursec.Ganger.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderDelegate?.didSelect(row: row)
    }
}

//
//  FourthViewController.swift
//  FindUniversityApp
//
//  Created by Bariev Daniil on 30.06.2023.
//

import Foundation
import SnapKit
import UIKit

class FourthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    
    private func initialize() {
        view.backgroundColor = UIColor(red: 107/255, green: 124/255, blue: 255/255, alpha: 1)
        
        let label = UILabel()
        label.text = "Оставить отзыв"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 28)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(150)
        }
        
        let textField = UITextField()
        view.addSubview(textField)
        textField.placeholder = "Введите отзыв"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 2.0
        textField.layer.cornerRadius = 30.0
        textField.layer.borderColor = UIColor(red: 63/255, green: 65/255, blue: 221/255, alpha: 1).cgColor
        textField.clipsToBounds = true
        textField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(label).inset(100)
            textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
            textField.heightAnchor.constraint(equalToConstant: 300).isActive = true
        }
        
        let button = UIButton(type: .system)
        view.addSubview(button)
        button.backgroundColor = UIColor(red: 63/255, green: 56/255, blue: 221/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.cornerRadius = 24
        button.setTitle("Выбрать", for: .normal)
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(40)
        }
    }
}


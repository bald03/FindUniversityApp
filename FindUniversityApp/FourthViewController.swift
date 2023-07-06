//
//  FourthViewController.swift
//  FindUniversityApp
//
//  Created by Bariev Daniil on 30.06.2023.
//

import Foundation
import SnapKit
import UIKit

final class FourthViewController: BaseViewController {
    
    var selectedButton: UIButton?
    var textField: UITextField!
    
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
        label.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(60)
        }
        
        textField = UITextField()
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
            textField.heightAnchor.constraint(equalToConstant: 400).isActive = true
        }
        

        let buttonSize = CGSize(width: 60, height: 60)
        let buttonSpacing: CGFloat = 10
        let buttonContainer = UIStackView()
        buttonContainer.axis = .horizontal
        buttonContainer.alignment = .center
        buttonContainer.spacing = buttonSpacing
        view.addSubview(buttonContainer)
        
        for i in 1...5 {
            let button = UIButton(type: .system)
            button.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
            button.layer.cornerRadius = buttonSize.width / 2
            button.setTitle("\(i)", for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside) // Add target action
            buttonContainer.addArrangedSubview(button)
            button.snp.makeConstraints { make in
                make.size.equalTo(buttonSize)
            }
        }
        
        buttonContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textField.snp.bottom).offset(20)
        }
        
        let chooseButton = UIButton(type: .system)
        view.addSubview(chooseButton)
        chooseButton.backgroundColor = UIColor(red: 63/255, green: 56/255, blue: 221/255, alpha: 1)
        chooseButton.setTitleColor(.white, for: .normal)
        chooseButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        chooseButton.layer.cornerRadius = 24
        chooseButton.setTitle("Выбрать", for: .normal)
        chooseButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        chooseButton.addTarget(self, action: #selector(chooseButtonTapped), for: .touchUpInside) // Add target action
        chooseButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(40)
        }
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        if let selectedButton = selectedButton {
            selectedButton.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        }
        
        sender.backgroundColor = UIColor(red: 63/255, green: 56/255, blue: 221/255, alpha: 1)
        selectedButton = sender
    }
    
    @objc private func chooseButtonTapped() {
        selectedButton?.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        selectedButton = nil
        textField.text = ""
    }
}



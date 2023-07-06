//
//  UITrait.swift
//  FindUniversityApp
//
//  Created by Ruslan Sanarkhin on 02.07.2023.
//

import UIKit

protocol UITrait {}

extension UITrait where Self: UIViewController {
    
    func setupLabel(_ label: UILabel, text: String, fontSize: CGFloat = 20) {
        label.text = text
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        view.addSubview(label)
    }
}

// Протоколы в Свифте как аналог интерфейса в общем понимании программирования
// Через extension можно выносить методы с дефолтной реализацией, а через : UITrait уже получить к ним доступ
// В данном случае для ViewController'a специально сделан extension с ограничением по его типу и BaseViewController уже соотвтетствует UITrait

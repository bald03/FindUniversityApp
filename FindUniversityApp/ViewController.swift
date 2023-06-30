//
//  ViewController.swift
//  FindUniversityApp
//
//  Created by Bariev Daniil on 29.06.2023.
//

import SnapKit
import UIKit

class ViewController: UIViewController {

    let countriesForPickerView = ["Россия", "США", "Германия", "Франция", "Великобритания", "Турция", "Китай"]
    
    let resultOfPickerLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    
    private func initialize() {
        view.backgroundColor = UIColor(red: 107/255, green: 124/255, blue: 255/255, alpha: 1)
        
    
        
        let label = UILabel()
        label.text = "Добро пожаловать!"
        label.textAlignment = .center
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(90)
            make.top.equalToSuperview().inset(180)
        }
        
        let extraLabel = UILabel()
        extraLabel.text = "Выберите страну для начала работы"
        extraLabel.numberOfLines = 0
        extraLabel.textAlignment = .center
        extraLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        extraLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(extraLabel)
        extraLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(label).inset(70)
        }
        
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.backgroundColor = UIColor.clear
        view.addSubview(pickerView)
        pickerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(extraLabel).inset(70)
        }
        
        view.addSubview(resultOfPickerLabel)
        resultOfPickerLabel.text = "Текущая страна: "
        extraLabel.numberOfLines = 0
        resultOfPickerLabel.textAlignment = .center
        resultOfPickerLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        resultOfPickerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(extraLabel)
        resultOfPickerLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(pickerView).inset(300)
        }
        
        let button = UIButton(type: .system)
        view.addSubview(button)
        button.backgroundColor = UIColor(red: 63/255, green: 56/255, blue: 221/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.cornerRadius = 24
        button.setTitle("Выбрать", for: .normal)
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.addTarget(self, action: #selector(openUniversityWebsite), for: .touchUpInside)
        button.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(resultOfPickerLabel).inset(100)
        }
        
    }
    @objc func openUniversityWebsite() {
        let vs = thirdViewController()
        show(vs, sender: nil)
    }
}

extension ViewController:UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countriesForPickerView.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedValue = countriesForPickerView[row]
        resultOfPickerLabel.text = selectedValue
    }
}

extension ViewController:UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let countriesForPickerView = ["Россия", "США", "Германия", "Франция", "Великобритания", "Турция", "Китай"]
        return countriesForPickerView[row]
    }
}




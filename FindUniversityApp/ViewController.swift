//
//  ViewController.swift
//  FindUniversityApp
//
//  Created by Bariev Daniil on 29.06.2023.
//

import SnapKit
import UIKit

final class ViewController: BaseViewController {
    
    private lazy var resultOfPickerLabel = UILabel()
    private lazy var welcomeLabel = UILabel()
    private lazy var extraLabel = UILabel()
    private lazy var pickerView = UIPickerView()
    private lazy var button = UIButton(type: .system)
    
    let commonString = "Текущая страна: "
    let countriesForPickerView = ["Бельгия", "Великобритания", "Германия", "Китай", "США", "Франция", "Швеция"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupLabel(welcomeLabel, text: "Добро пожаловать!", fontSize: 24)
        setupConstraints()
        
        extraLabel.text = "Выберите страну для начала работы"
        extraLabel.numberOfLines = 0
        extraLabel.textAlignment = .center
        extraLabel.textColor = UIColor.white
        extraLabel.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(extraLabel)
        extraLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(welcomeLabel).inset(150)
        }
        
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.backgroundColor = UIColor.clear
        view.addSubview(pickerView)
        pickerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(extraLabel).inset(70)
        }
        
        view.addSubview(resultOfPickerLabel)
        resultOfPickerLabel.numberOfLines = 0
        resultOfPickerLabel.text = commonString + countriesForPickerView.first!
        resultOfPickerLabel.textAlignment = .center
        resultOfPickerLabel.textColor = UIColor.white
        resultOfPickerLabel.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(resultOfPickerLabel)
        resultOfPickerLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(pickerView).inset(340)
        }
        
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
            make.bottom.equalToSuperview().inset(40)
        }
    }
    
    private func setupConstraints() {
        welcomeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(90)
            make.top.equalToSuperview().inset(130)
        }
    }
    
    @objc private func openUniversityWebsite() {
        let vc = SecondViewController()
        vc.selectedCountry = resultOfPickerLabel.text?.replacingOccurrences(of: commonString, with: "")
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return countriesForPickerView.count
        }
    }
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let selectedValue = countriesForPickerView[row]
            resultOfPickerLabel.text = commonString + selectedValue
        }
    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let title = countriesForPickerView[row]
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        return NSAttributedString(string: title, attributes: attributes)
    }
}





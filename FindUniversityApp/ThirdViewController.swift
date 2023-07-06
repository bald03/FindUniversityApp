//
//  1.swift
//  FindUniversityApp
//
//  Created by Bariev Daniil on 30.06.2023.
//

import Foundation
import SnapKit
import UIKit

final class ThirdViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize() {
        view.backgroundColor = UIColor(red: 107/255, green: 124/255, blue: 255/255, alpha: 1)
        
        let label = UILabel()
        label.text = "Информация об университете"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(60)
        }
        
        let button = UIButton(type: .system)
        view.addSubview(button)
        button.backgroundColor = UIColor(red: 63/255, green: 56/255, blue: 221/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.cornerRadius = 24
        button.setTitle("Оставить отзыв", for: .normal)
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.addTarget(self, action: #selector(openReviewPage), for: .touchUpInside)
        button.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(40)
        }
        
        let extraButton = UIButton(type: .system)
        view.addSubview(extraButton)
        extraButton.backgroundColor = UIColor(red: 63/255, green: 56/255, blue: 221/255, alpha: 1)
        extraButton.setTitleColor(.white, for: .normal)
        extraButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        extraButton.layer.cornerRadius = 24
        extraButton.setTitle("Поделиться", for: .normal)
        extraButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        extraButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalTo(button).inset(65)
        }
        
        let moveToSiteOfUniversityButton = UIButton(type: .system)
        view.addSubview(moveToSiteOfUniversityButton)
        moveToSiteOfUniversityButton.setTitleColor(.white, for: .normal)
        moveToSiteOfUniversityButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        moveToSiteOfUniversityButton.setTitle("Перейти на сайт", for: .normal)
        moveToSiteOfUniversityButton.addTarget(self, action: #selector(openUniversityWebsite), for: .touchUpInside)
        moveToSiteOfUniversityButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalTo(extraButton).inset(100)
        }
    }
    
    
    @objc private func openUniversityWebsite() {
        if let url = URL(string: "https://www.volgatech.net/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc private func openReviewPage() {
        let fourthVC = FourthViewController()
        navigationController?.pushViewController(fourthVC, animated: true)
    }
}


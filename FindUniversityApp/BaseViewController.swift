//
//  BaseViewController.swift
//  FindUniversityApp
//
//  Created by Ruslan Sanarkhin on 02.07.2023.
//

import UIKit

class BaseViewController: UIViewController, UINavigationControllerDelegate, UITrait {
    
    private lazy var backgroundImage = UIImage(named: "bg-splash")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.delegate = self
        setupBackground()
    }
    
    private func setupBackground() {
        let imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = backgroundImage
        imageView.center = view.center
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
    }
}

// Сюда можно вытащить общие свойства для контроллера, которые везде дублируются
// Через наследование от BaseViewController

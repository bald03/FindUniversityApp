//
//  SecondViewController.swift
//  FindUniversityApp
//
//  Created by Bariev Daniil on 30.06.2023.
//

import Foundation
import SnapKit
import UIKit


final class SecondViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    private lazy var label = UILabel()
    private lazy var button = UIButton(type: .system)
    private lazy var extraButton = UIButton(type: .system)
    private lazy var moveToSiteOfUniversityButton = UIButton(type: .system)
    private lazy var tableView = UITableView()
    
    var selectedCountry: String?
    var namesOfUniversities = [Universities]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        downloadJSON {
            self.tableView.reloadData()
        }
    }
    
    private func initialize() {
        view.backgroundColor = UIColor(red: 107/255, green: 124/255, blue: 255/255, alpha: 1)
        
        label.text = selectedCountry ?? ""
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(60)
        }
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.left.right.bottom.equalToSuperview()
                   
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesOfUniversities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = namesOfUniversities[indexPath.row].name.capitalized
        let filtered = namesOfUniversities.filter { $0.code == "CL" }
        print(filtered)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thirdViewController = ThirdViewController()
        thirdViewController.currentUniversity = namesOfUniversities[indexPath.row]
        navigationController?.pushViewController(thirdViewController, animated: true)
    }
    
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://raw.githubusercontent.com/Hipo/university-domains-list/master/world_universities_and_domains.json")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.namesOfUniversities = try JSONDecoder().decode([Universities].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch {
                    print("JSON Error")
                }
            }
        }.resume()
    }
}

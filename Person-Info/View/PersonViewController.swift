//
//  PersonViewController.swift
//  Exam1
//
//  Created by Tejasv Singh on 9/12/25.
//

import UIKit
class PersonViewController: UIViewController {
    let networkManager = NetworkManager.shared
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.frame = CGRect(x: 50, y: 100, width: 100, height: 50)
        label.textColor = .systemGray
        label.backgroundColor = .red
        return label
    }()
    let genderLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.frame = CGRect(x: 50, y: 150, width: 100, height: 50)
        label.textColor = .systemGray
        label.backgroundColor = .green
        return label
    }()
    var OutputText: String = ""
    var fetchedName: String = ""
    var fetchedGender: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getDataFromServer {
            [weak self] in
            DispatchQueue.main.async {
                self?.nameLabel.text = self?.fetchedName
                self?.genderLabel.text = self?.fetchedGender
            }
        }
        view.addSubview(nameLabel)
        view.addSubview(genderLabel)
                
    }
    func getDataFromServer(closure: @escaping (() -> Void)) {
            networkManager.getData(from: Server.endPoint){ [weak self] result in
            guard let self = self else { return }
                let people: person = self.networkManager.parse(data: result) ??  person(name: "", gender: "")
                self.fetchedName = people.name
                self.fetchedGender = people.gender
                closure()
            }
            }
        }
    
    


//
//  PersonViewController.swift
//  Exam1
//
//  Created by Tejasv Singh on 9/12/25.
//

import UIKit
class PersonViewController: UIViewController {
    
    private let viewModel = PersonViewModel()
    
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
        
        
        viewModel.getDataFromServer {
            [weak self] in
            DispatchQueue.main.async {
                self?.nameLabel.text = self?.viewModel.fetchedName
                self?.genderLabel.text = self?.viewModel.fetchedGender
            }
        }
        view.addSubview(nameLabel)
        view.addSubview(genderLabel)
        
    }
}
    
    


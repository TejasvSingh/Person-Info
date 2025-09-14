//
//  PersonViewModel.swift
//  Person-Info
//
//  Created by Koushik Reddy Kambham on 9/13/25.
//

import Foundation

class PersonViewModel {
    var personobj : person!
    
    var fetchedName: String = ""
    var fetchedGender: String = ""
    
    var networkManager: NetworkManager = NetworkManager.shared
    
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

//
//  NetworkManager.swift
//  Exam1
//
//  Created by Tejasv Singh on 9/12/25.
//
import Foundation
class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
   func getData(from urlString: String, closure: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
           closure(nil)
           return
       }
       
       URLSession.shared.dataTask(with: url) { data, _, error in
           if let error = error {
               print("Error fetching data: \(error)")
               closure(nil)
               return
           }
           closure(data)
       }.resume()
        
    }
    
    func parse(data: Data?)-> person?{
        guard let data = data else {
            return nil
        }
        do {
            let decoder = JSONDecoder()
            let people = try decoder.decode(person.self, from: data)
            return people
        } catch {
            print("Error parsing data: \(error)")
            return nil
        }
    }
}

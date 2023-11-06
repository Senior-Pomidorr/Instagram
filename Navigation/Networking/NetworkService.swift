//
//  NetworkService.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 06.11.2023.
//

import Foundation
class NetworkService {
    
    static let network = NetworkService()
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("error in request")
            } else {
                if let resp = response as? HTTPURLResponse,
                   resp.statusCode == 200,
                   let responseData = data {
                    let posts = try? JSONDecoder().decode([Posts].self, from: responseData)
                    print(posts)
                }
    
            }
        }.resume()
    }
}


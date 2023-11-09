//
//  NetworkService.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 06.11.2023.
//

import Foundation
final class NetworkService {
    
    static let shared = NetworkService()
    
    private let token = "h7_bDw4e3X7fgQ7bBio61x9dqx8u_okLt5C-CWDhZfI"
    private init() {}
    
    func getPosts(_ completion: @escaping (Data?, Error?) -> ())  {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.unsplash.com"
        urlComponents.path = "/search/photos"
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "query", value: "relevant"),
            URLQueryItem(name: "per_page", value: "30"),
            URLQueryItem(name: "order_by", value: "popular"),
            //                        URLQueryItem(name: "client_id", value: "h7_bDw4e3X7fgQ7bBio61x9dqx8u_okLt5C-CWDhZfI"),
        ]
        
        guard let url = urlComponents.url else { return }
        //        print("URL: \(url)")
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("Client-ID \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            print("REQUEST \(request)")
            guard error == nil else {
                print(error?.localizedDescription ?? "error")
                return
            }
            
            if let resp = response as? HTTPURLResponse {
                print("Response status code: \(resp.statusCode)")
            }
            
            DispatchQueue.main.async {
                completion(data, error)
//                print("Response posts data = \(String(decoding: data!, as: UTF8.self))")
            }
        }.resume()
    }
}


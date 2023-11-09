//
//  NetworkDataFetcher.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 08.11.2023.
//

import Foundation

class NetworkDataFetcher {
    
    func fetchImages(searchTerm: String, completion: @escaping (SearchResults?) -> ()) {
        NetworkService.shared.getPosts { data, error in
            if let error = error {
                print("Error recived requesting data: \(error.localizedDescription)")
                completion(nil)
            }
            
            let decode = self.decodeJSON(type: SearchResults.self, from: data)
            completion(decode)
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        guard let data = from else { return nil }
        do {
            let objects = try JSONDecoder().decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Faile to decode JSON", jsonError)
            return nil
        }
    }
    
}


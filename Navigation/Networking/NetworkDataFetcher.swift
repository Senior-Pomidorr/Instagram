//
//  NetworkDataFetcher.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 08.11.2023.
//

import Foundation

class NetworkDataFetcher {
    
    func fetchImages(searchTerm: String, completion: @escaping (Result<SearchResults?, Error>) -> ()) {
        NetworkService.shared.getPosts(searchTerm: searchTerm) { result in
            switch result {
            case .success(let data):
                
                do {
                    let decodeData = try self.decodeJSON(type: SearchResults.self, from: data)
                    completion(.success(decodeData))
                } catch {
                    completion(.failure(NetworkingError.invalidData))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) throws -> T? {
        guard let data = from else { return nil }
        
        do {
            let objects = try JSONDecoder().decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
}


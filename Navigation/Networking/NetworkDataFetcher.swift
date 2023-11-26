//
//  NetworkDataFetcher.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 08.11.2023.
//

import Foundation

final class NetworkDataFetcher {
    
    func fetchImages(searchTerm: String) async throws -> SearchResults {
        let data = try await NetworkService.shared.getPosts(searchTerm: searchTerm)
        let decodedData = try decodeJSON(type: SearchResults.self, from: data)
        return decodedData
    }
    
    
    
    private func decodeJSON<T: Decodable>(type: T.Type, from data: Data) throws  -> T {
        do {
            let objects = try JSONDecoder().decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            throw NetworkingError.invalidData
        }
    }
}


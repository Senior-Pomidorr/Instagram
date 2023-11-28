//
//  NetworkDataFetcher.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 08.11.2023.
//

import Foundation

final class NetworkDataFetcher {
    func fetchSearchPosts(searchTerm: String) async throws -> SearchResults {
        let data = try await NetworkService.shared.getPosts(query: .getSearchQuery(searchTerm))
        let decodedData = try decodeJSON(type: SearchResults.self, from: data)
        return decodedData
    }
    
    func fetchFeedPosts() async throws -> [FeedPhotos] {
        let data = try await NetworkService.shared.getPosts(query: .getFeedQuery)
        let decodedData = try decodeJSON(type: [FeedPhotos].self, from: data)
        return decodedData
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from data: Data) throws  -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            throw NetworkingError.invalidData
        }
    }
}


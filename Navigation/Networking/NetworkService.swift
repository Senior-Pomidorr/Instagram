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
    
    private func getFeedComponents() -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.unsplash.com"
        urlComponents.path = "/search/photos"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "query", value: "relevant"),
            URLQueryItem(name: "per_page", value: "30"),
            URLQueryItem(name: "order_by", value: "popular"),
        ]
        return urlComponents
    }
    
    private func getSearchComponents(query: String) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.unsplash.com"
        urlComponents.path = "/search/photos"
        urlComponents.query = query
        
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "per_page", value: "50"),
            URLQueryItem(name: "order_by", value: "popular"),
        ]
        return urlComponents
    }
    
    func getPosts(searchTerm: String) async throws -> Data {
        let urlComponents = getSearchComponents(query: searchTerm)
        guard let url = urlComponents.url else {
            throw NetworkingError.badUrl
        }
        
        do {
            var request = URLRequest(url: url)
            request.httpMethod = HTTPMethod.get.rawValue
            request.setValue("Client-ID \(token)", forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            print("REQUEST: - \(request)")
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Response status code: \(httpResponse.statusCode)")
            }
            
           
                print("Response posts data = \(String(decoding: data, as: UTF8.self))")
           
            return data
        } catch {
            throw NetworkingError.badRequest
        }
    }
}




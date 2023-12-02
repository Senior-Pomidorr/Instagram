//
//  NetworkService.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 06.11.2023.
//

import Foundation

enum EndpointQuery {
    case getFeedQuery
    case getSearchQuery(String)
}

final class NetworkService {
    
    static let shared = NetworkService()
    private let token = "h7_bDw4e3X7fgQ7bBio61x9dqx8u_okLt5C-CWDhZfI"
    private var page = 0
    private init() {}
    
    private func getFeedComponents() -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.unsplash.com"
        urlComponents.path = "/photos"
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "query", value: "relevant"),
            URLQueryItem(name: "per_page", value: "40"),
            URLQueryItem(name: "order_by", value: "popular"),
        ]
        return urlComponents
    }
    
    private func getSearchComponents(search query: String) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.unsplash.com"
        urlComponents.path = "/search/photos"
        urlComponents.query = query
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "per_page", value: "50"),
            URLQueryItem(name: "order_by", value: "popular"),
        ]
        return urlComponents
    }
    
    func getPosts(query: EndpointQuery) async throws -> Data {
        var urlComponents = URLComponents()
        switch query {
        case .getFeedQuery:
            urlComponents = getFeedComponents()
            page += 1
        case let .getSearchQuery(searchQuery):
            urlComponents = getSearchComponents(search: searchQuery)
            page += 1
        }
        
        guard let url = urlComponents.url else {
            throw NetworkingError.badUrl
        }
        do {
            var request = URLRequest(url: url)
            request.httpMethod = HTTPMethod.get.rawValue
            request.setValue("Client-ID \(token)", forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            print("REQUEST: - \(request)")
            
            guard let httpResponse = response as? HTTPURLResponse else { throw NetworkingError.badResponse }
            print("Response status code: \(httpResponse.statusCode)")
            //                print("Response posts data = \(String(decoding: data, as: UTF8.self))")
            return data
        } catch {
            print(error.localizedDescription)
            throw NetworkingError.badRequest
        }
    }
}




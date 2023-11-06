//
//  Endpoint.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 05.11.2023.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
}

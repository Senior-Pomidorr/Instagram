//
//  NetworkingError.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 11/21/23.
//

import Foundation

enum NetworkingError: Error {
    case badUrl
    case badRequest
    case badResponse
    case invalidData
}


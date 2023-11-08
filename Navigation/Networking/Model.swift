//
//  Model.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 06.11.2023.
//

import Foundation

struct SearchResults: Decodable {
    let total: Int
    var results: [UnsplashPhoto]
}

struct UnsplashPhoto: Decodable {
    let width: Int
    let height: Int
    let urls: [URLKIng.RawValue:String]
    
    enum URLKIng: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}




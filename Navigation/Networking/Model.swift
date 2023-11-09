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
    let likes: Int
    let urls: [URLKIng.RawValue:String]
    let user: User
//    let cover_photo: DescriptionText
    
    enum URLKIng: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
    
}

struct User: Decodable {
    let profile_image: [ProfileImage.RawValue: String]
    let username: String
    
    enum ProfileImage: String {
        case small
        case medium
        case large
    }
}

//struct DescriptionText: Decodable {
//    let description: String
//}


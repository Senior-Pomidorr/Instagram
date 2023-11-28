//
//  Model.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 06.11.2023.
//

import Foundation

// MARK: - SearchFeed
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
    let profile_image: [ProfileImage.RawValue:String]
    let username: String
    
    enum ProfileImage: String {
        case small
        case medium
        case large
    }
}

// MARK: - MainFeed
struct FeedPhotos: Decodable {
    let urls: [URLMainImage.RawValue: String]
    let description: String?
    let likes: Int
    let user: UserMain
   
    enum URLMainImage: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}

struct ProfileMainImage: Decodable {
    
}

// MARK - MainFeedUser
struct UserMain: Decodable {
    let id: String
    let username: String
    let profileImage: [User.RawValue: String]
    
    enum User: String {
        case small
        case medium
        case large
    }
    enum Profile: String, CodingKey {
        case profileImage = "profile_image"
    }
//    let profileImage: ProfileMainImage
}



//
//  File.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 27.02.2023.
//

import UIKit

struct ProfilePosts {
    let author: String
    var description: String
    var image: UIImage
    var likes: Int
    var views: Int
    
    static func showPosts() -> [ProfilePosts] {
        var post = [ProfilePosts]()
        post.append(ProfilePosts(author: "Kanye West", description: "Open a new store. “We are going to open Yeezy stores sic worldwide. Starting in Atlanta. “I’ll buy the land and the building, and then we're gonna open up in every state, and then internationally”", image: UIImage(named: "openstore")!, likes: 23057, views: 52732))
        post.append(ProfilePosts(author: "Kanye West", description: "At the best of times...", image: UIImage(named:"kidcudi")!, likes: 53456, views: 320572))
        post.append(ProfilePosts(author: "Kanye West", description: "I miss...you gave me the best years of my life, i always think about you.", image: UIImage(named:"kim")!, likes: 100456, views: 620572))
        post.append(ProfilePosts(author: "Kanye West", description: "Recorded with my bro a new track, from the studio. Wait my new album..", image: UIImage(named:"studio")!, likes: 100456, views: 620572))
        return post
    }
}

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
    
    static func showPosts() -> [[ProfilePosts]] {
        var feedPosts = [[ProfilePosts]]()
        var post = [ProfilePosts]()
        post.append(ProfilePosts(author: "Kanye West", description: "Open a new store", image: UIImage(named: "openstore")!, likes: 23057, views: 52732))
        post.append(ProfilePosts(author: "Kanye West", description: "At the best of times...", image: UIImage(named:"kidcudi")!, likes: 53456, views: 320572))
        post.append(ProfilePosts(author: "Kanye West", description: "I miss...", image: UIImage(named:"kim")!, likes: 100456, views: 620572))
        post.append(ProfilePosts(author: "Kanye West", description: "Recorded a new track in the studio", image: UIImage(named:"studio")!, likes: 100456, views: 620572))
        
        for _ in post {
            feedPosts.append(post)
        }
        return feedPosts
    }
}

//
//  PostController.swift
//  TimeLine
//
//  Created by Taylor Bills on 2/12/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    
    // MARK: -  Properties
    static let shared = PostController()
    var posts: [Post] = []
    
    // MARK: -  CRUD
    
    func createPostWith(image: UIImage, caption: String) {
        guard let data = UIImagePNGRepresentation(image) else { return }
        let newPost = Post(photoData: data)
        self.posts.insert(newPost, at: 0)
    }

    func addComment(toPost post: Post, text: String) {
        let comment = Comment(text: text, post: post)
        post.comments.insert(comment, at: 0)
    }
}

//
//  Comment.swift
//  TimeLine
//
//  Created by Taylor Bills on 2/12/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import Foundation

class Comment {
    
    // MARK: -  Properties
    let text: String
    let timestamp: Date = Date()
    let post: Post
    
    // MARK: -  Initializer
    init(text: String, post: Post) {
        self.text = text
        self.post = post
    }
}

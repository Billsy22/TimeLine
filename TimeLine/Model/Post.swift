//
//  Post.swift
//  TimeLine
//
//  Created by Taylor Bills on 2/12/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import Foundation
import UIKit

class Post {
    
    // MARK: -  Properties
    let photoData: Data?
    let timestamp: Date = Date()
    var comments: [Comment] = []
    var photo: UIImage? {
        guard let photoData = photoData else { return nil }
        return UIImage(data: photoData)
    }
    
    // MARK: -  Initializer
    
    init(photoData: Data) {
        self.photoData = photoData
    }
}

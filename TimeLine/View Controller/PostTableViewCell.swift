//
//  PostTableViewCell.swift
//  TimeLine
//
//  Created by Taylor Bills on 2/12/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: -  Properties
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var postImageView: UIImageView!
    
    // MARK: -  UpdateViews
    func updateViews() {
        guard let post = post else { return }
        postImageView.image = post.photo
    }
}

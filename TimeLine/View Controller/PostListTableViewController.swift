//
//  PostListTableViewController.swift
//  TimeLine
//
//  Created by Taylor Bills on 2/12/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {
    
    // MARK: -  Properties
    
    // MARK: -  Table View Data Source Functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostController.shared.posts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        let post = PostController.shared.posts[indexPath.row]
        cell.post = post
        return cell
    }
    
    // MARK: -  Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostDetail" {
            guard let postDetail = segue.destination as? PostDetailTableViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let post = PostController.shared.posts[indexPath.row]
            postDetail.post = post
        }
    }
}

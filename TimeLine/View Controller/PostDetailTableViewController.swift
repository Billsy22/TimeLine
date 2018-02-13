//
//  PostDetailTableViewController.swift
//  TimeLine
//
//  Created by Taylor Bills on 2/12/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    
    // MARK: -  Properties
    var post: Post?
    
    @IBOutlet weak var postImageImageView: UIImageView!
    
    // MARK: -  Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 40
        updateViews()
    }
    
    // MARK: -  Table View Data Source Functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let post = post else { return 0 }
        return post.comments.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        let comment = post?.comments[indexPath.row]
        cell.textLabel?.text = "\(comment?.timestamp)"
        cell.detailTextLabel?.text = comment?.text
        return cell
    }
    
    // MARK: -  Actions
    
    @IBAction func commentButtonTapped(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "New Comment", message: "What would you like to say", preferredStyle: .alert)
        alert.addTextField { (commentTextField) in
            commentTextField.placeholder = "Cool pic bruh..."
        }
        
        let ok = UIAlertAction(title: "Ok", style: .default) { (_) in
            guard let text = alert.textFields?.first?.text, !text.isEmpty, let post = self.post else { return }
            PostController.shared.addComment(toPost: post, text: text)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        self.tableView.reloadData()
    }
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func followButtonTapped(_ sender: UIButton) {
    }
    
    
    // MARK: -  Update Views
    func updateViews() {
        guard let post = post else { return }
        postImageImageView.image = post.photo
        tableView.reloadData()
    }
}

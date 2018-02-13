//
//  AddPostTableViewController.swift
//  TimeLine
//
//  Created by Taylor Bills on 2/12/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    
    // MARK: -  Properties
    
    @IBOutlet weak var selectPhotoButton: UIButton!
    @IBOutlet weak var postImageImageView: UIImageView!
    @IBOutlet weak var captionTextField: UITextView!
    
    // MARK: -  Actions
    
    @IBAction func selectPhotoButtonTapped(_ sender: UIButton) {
        postImageImageView.image = UIImage(imageLiteralResourceName: "static")
        selectPhotoButton.titleLabel?.text = ""
    }
    
    @IBAction func postButtonTapped(_ sender: UIButton) {
        guard let caption = captionTextField.text, let photo = postImageImageView.image else { return }
        if caption.isEmpty || photo.images?.count == 0 {
            let alert = UIAlertController(title: "Whoops!", message: "You forgot something! Check to see if you selected a photo and captioned it!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        } else {
            PostController.shared.createPostWith(image: photo, caption: caption)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        captionTextField.text = ""
        postImageImageView.image = nil
        navigationController?.popViewController(animated: true)
    }
    
}

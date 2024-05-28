//
//  UserDetailViewController.swift
//  TechTest
//
//  Created by Adwait Gaikwad on 28/05/24.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var labelPostDescription: UILabel!
    @IBOutlet weak var labelPostId: UILabel!
    @IBOutlet weak var labelPostTitle: UILabel!
    @IBOutlet weak var postDetailsBaseView: UIView!
    
    
    var userDetailsElement: PostModelElement?
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpDataToView()
    }
    
    func setUpDataToView() {
        self.title = "Post Details"
        self.postDetailsBaseView.layer.cornerRadius = 12
        labelPostDescription.text = "Post Description :\n" + (userDetailsElement?.body ?? "")
        labelPostId.text = "\(userDetailsElement?.id ?? 0)"
        labelPostTitle.text = "Post Title :\n" + (userDetailsElement?.title ?? "")
    }

}

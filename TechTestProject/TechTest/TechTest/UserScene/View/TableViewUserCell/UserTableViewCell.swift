//
//  UserTableViewCell.swift
//  TechTest
//
//  Created by Adwait Gaikwad on 28/05/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDesriptionLabel: UILabel!
    @IBOutlet weak var postIdLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpUiComponent()
        
    }

    
    func setUpUiComponent() {
        
        baseView.layer.cornerRadius = 8
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

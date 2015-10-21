//
//  UserTableViewCell.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-10-19.
//  Copyright © 2015 Yung Dai. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
  
    @IBOutlet weak var userImage: PictureImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var favourite: UIButton!
    
    @IBOutlet weak var addFriend: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

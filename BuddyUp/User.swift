//
//  User.swift
//  
//
//  Created by Yung Dai on 2015-06-17.
//
//

import UIKit

class User: PFUser, PFSubclassing {
    
    // TODO: impliment this as a subclass
    
    override init() {
        super.init()
        
    }
    
    // create an override
    convenience init(username: String!, password: String!) {
        self.init()
        PFUser.currentUser()?.username
        self.username = username
        self.password = password
        
        
    }
   
}

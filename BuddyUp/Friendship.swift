//
//  Friendship.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-06-10.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

class Friendship: PFObject, PFSubclassing {
   
    class func parseClassName() -> String {
        return "Friendship"
    }
    
    var currentUser: User? {
        get { return objectForKey("currentUser") as? User }
        set { setObject(newValue!, forKey: "currentUser") }
        
    }
    
    var theFriend: User? {
        get { return objectForKey("theFriend") as? User }
        set { setObject(newValue!, forKey: "theFriend") }
    }
    
    var selected = false
    
}

//
//  UserModelController.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-06-09.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

class UserModelController: NSObject {
    
    var userArray = NSMutableArray()
    
    func populateUserModelArray () {
        userArray[0] = NetworkController().getUserModel()
    }

    
   
}

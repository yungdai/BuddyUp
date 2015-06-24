//
//  MainAppViewController.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-06-08.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

class MainAppViewController: UIViewController {
    
    let currentUser = PFUser.currentUser()
    let iPhoneImageDimension:CGFloat = 100.0
    let iPadImageDimension:CGFloat = 145.0
    
    // activities parse object
    var activities: [PFObject] = []
    
    @IBOutlet var personImage: UIImageView!
    @IBOutlet var personLabelText: UILabel!
    @IBOutlet var activityTypeLabelText: UILabel!
    @IBOutlet var startTimeLabelText: UILabel!
    @IBOutlet var endTimeLabelText: UILabel!
    @IBOutlet var activityTypeImage: UIImageView!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var crossButton: UIButton!
    
//    @IBOutlet var activityImageHeightConstraint: NSLayoutConstraint!
//    @IBOutlet var activityImageWidthConstraint: NSLayoutConstraint!
//    @IBOutlet var personImageHeightConstraint: NSLayoutConstraint!
//    @IBOutlet var personImageWidthConstraint: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get all Activity Objects that aren't yours
        var query = PFQuery(className: "Activity")
        query.whereKey("creator", notEqualTo: PFUser.currentUser()!.username!)
        
        // getting the data asynchronusly in the background
        query.findObjectsInBackgroundWithBlock { (result: [AnyObject]?, error: NSError?) -> Void in
            if let activities = result as? [PFObject] {
                self.activities = activities
            }
        }
        
//        configureConstraints()
        
    }
    
    
//    func cardView(cardView: UIView, activityForRowAtIndexPath indexPath: NSIndexPath) -> UIView {
//        var activityCard = "ActivityCard"
//        let activityCard = cardView(activityCard, activityForRowAtIndexPath: indexPath) as! UIView
//    }

    
//    func configureConstraints() {
//        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
//            
//            activityImageHeightConstraint.constant = iPhoneImageDimension
//            activityImageWidthConstraint.constant = iPhoneImageDimension
//            personImageHeightConstraint.constant = iPhoneImageDimension
//            personImageWidthConstraint.constant = iPhoneImageDimension
//
//            
//        } else if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
//            
//            activityImageHeightConstraint.constant = iPadImageDimension
//            activityImageWidthConstraint.constant = iPadImageDimension
//            personImageHeightConstraint.constant = iPadImageDimension
//            personImageWidthConstraint.constant = iPadImageDimension
//
//        }
//    }

}


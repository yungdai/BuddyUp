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
    
    
    
    @IBOutlet var personImage: UIImageView!
    @IBOutlet var personLabelText: UILabel!
    @IBOutlet var activityTypeLabelText: UILabel!
    @IBOutlet var startTimeLabelText: UILabel!
    @IBOutlet var endTimeLabelText: UILabel!
    @IBOutlet var activityTypeImage: UIImageView!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var crossButton: UIButton!
    
    @IBOutlet var activityImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet var activityImageWidthConstraint: NSLayoutConstraint!
    @IBOutlet var personImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet var personImageWidthConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureConstraints()
                let query = PFUser.query()
                query?.findObjectsInBackgroundWithBlock({ (results:[AnyObject]?, error:NSError?) -> Void in
                    if let resultsUser = results as? [PFUser],
                        let currentUser = PFUser.currentUser(){
                        for user in resultsUser{
        //                    if user != currentUser{
                                let relation = user.relationForKey("Request")
                                //                    relation.addObject(currentUser)
                                ////                    let otherRelation = user.relationForKey("Request");
                                //                    user.saveInBackground()
                                let relationQuery = relation.query()
                                relationQuery?.whereKey("username", equalTo: user["username"]!)
                                relationQuery?.findObjectsInBackgroundWithBlock({ (results2:[AnyObject]?, error2:NSError?) -> Void in
                                    println("FOUND  USER!")
                                })
        //                    }
                        }
                    }
                })
        
    }
    
    // This is called when a user didn't fully swipe left or right.
    func viewDidCancelSwipe(view: UIView) -> Void{
        println("Couldn't decide, huh?")
    }
    
    // Sent before a choice is made. Cancel the choice by returning `false`. Otherwise return `true`.
    func view(view: UIView, shouldBeChosenWithDirection: MDCSwipeDirection) -> Bool{
        if (shouldBeChosenWithDirection == MDCSwipeDirection.Left) {
            return true;
        } else {
            // Snap the view back and cancel the choice.
            UIView.animateWithDuration(0.16, animations: { () -> Void in
                view.transform = CGAffineTransformIdentity
                view.center = view.superview!.center
            })
            return false;
        }
    }
    
    // This is called then a user swipes the view fully left or right.
    func view(view: UIView, wasChosenWithDirection: MDCSwipeDirection) -> Void{
        if wasChosenWithDirection == MDCSwipeDirection.Left {
            println("Photo deleted!")
        }else{
            println("Photo saved!")
        }
        
    }
    
    func configureConstraints() {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            activityImageHeightConstraint.constant = iPhoneImageDimension
            activityImageWidthConstraint.constant = iPhoneImageDimension
            personImageHeightConstraint.constant = iPhoneImageDimension
            personImageWidthConstraint.constant = iPhoneImageDimension
        } else if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            activityImageHeightConstraint.constant = iPadImageDimension
            activityImageWidthConstraint.constant = iPadImageDimension
            personImageHeightConstraint.constant = iPadImageDimension
            personImageWidthConstraint.constant = iPadImageDimension
        }
    }

}


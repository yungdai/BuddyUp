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
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

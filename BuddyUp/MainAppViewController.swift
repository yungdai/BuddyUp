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
    

    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
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

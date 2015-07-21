//
//  BuddiesTableViewController.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-06-10.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

class BuddiesTableViewController: UITableViewController {

    var userArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let query = PFUser.query()
        query?.whereKey("username", notEqualTo: PFUser.currentUser()!.username!)
        let users = query?.findObjects()
        if let _buddies = users {
            for user in users! {
                print(user["name"] as! String)
                userArray.append(user["name"] as! String)
                tableView.reloadData()
            }
        }
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return userArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        cell.textLabel?.text = userArray[indexPath.row]

        return cell
    }

}

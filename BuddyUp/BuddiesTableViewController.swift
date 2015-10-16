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

        // set up the refresh controls for this table
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("sortArray"), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl

        let query = PFUser.query()
        query?.whereKey("username", notEqualTo: PFUser.currentUser()!.username!)
        let users = query?.findObjects()
        if let buddies = users {
            for user in users! {
                print(user["name"] as! String)
                userArray.append(user["name"] as! String)
                tableView.reloadData()
            }
        }
        
    }
    
    func sortArray() {
        let sortedAlphabetically = Array(userArray.reverse())
        for(index,element) in sortedAlphabetically.enumerate() {
            userArray[index] = element
        }
        
        tableView.reloadData()
        refreshControl?.endRefreshing()
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) 

        // Configure the cell...
        cell.textLabel?.text = userArray[indexPath.row]

        return cell
    }
    
    
    // MARK: Segment Control code
    @IBOutlet weak var friendsSegmentControl: UISegmentedControl!
    


}

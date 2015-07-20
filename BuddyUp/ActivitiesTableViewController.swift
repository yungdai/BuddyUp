//
//  ActivitiesTableViewController.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-06-03.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

class ActivitiesTableViewController: UITableViewController {

    var activitesTypeArray: [String] = []
    var startTimeArray: [NSDate] = []
    var endTimeArray: [NSDate] = []
    var activityImageArray : [UIImage] = []
    var dateStyle = NSDateFormatterStyle.MediumStyle
    var activityObjectID: [String] = []
    
    //  The object that holds the activites
    var activities: [PFObject]  = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup the refresh controls for this table
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: ("refreshPage"), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl
        
        let query = PFQuery(className: "Activity")
        query.whereKey("creator", equalTo: PFUser.currentUser()!.username!)
        
        // getting the data asynchronously in the background
        query.findObjectsInBackgroundWithBlock { (result: [AnyObject]?, error: NSError?) -> Void in
            if let activities = result as? [PFObject] {
                self.activities = activities
                self.tableView.reloadData()
            }
        }
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        // setup the refresh controls for this table
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: ("refreshPage"), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl
        
        let query = PFQuery(className: "Activity")
        query.whereKey("creator", equalTo: PFUser.currentUser()!.username!)
        
        // getting the data asynchronously in the background
        query.findObjectsInBackgroundWithBlock { (result: [AnyObject]?, error: NSError?) -> Void in
            if let activities = result as? [PFObject] {
                self.activities = activities
                self.tableView.reloadData()
            }
        }

    }
    
    func refreshPage() {
        let query = PFQuery(className: "Activity")
        query.whereKey("creator", equalTo: PFUser.currentUser()!)
        
        // getting the data asynchronously in the background
        query.findObjectsInBackgroundWithBlock { (result: [AnyObject]?, error: NSError?) -> Void in
            if let activities = result as? [PFObject] {
                self.activities = activities
                print("found something")
            }
        }
        print("got more data")
        tableView.reloadData()
        refreshControl?.endRefreshing()

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
        return self.activities.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cellStyleFactory(indexPath)
    }

    func cellStyleFactory (indexPath: NSIndexPath) -> UITableViewCell {
        let cellType = "ActivityCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellType, forIndexPath: indexPath) as UITableViewCell
        
        // make sure that when you select the cell it doesn't have a style
        cell.selectionStyle = .None
        
        
        if let activityCell = cell as? ActivityTableViewCell {
            let dateFormat = NSDateFormatter()
            dateFormat.dateStyle = NSDateFormatterStyle.MediumStyle
            dateFormat.timeStyle = NSDateFormatterStyle.ShortStyle


            let activity = self.activities[indexPath.row]
            
            if let type = activity["activityType"] as? String{
                activityCell.activityTypeLabel.text = type
            }
            
            if let startTime = activity["startTime"] as? NSDate {
                activityCell.startTimeLabel.text = dateFormat.stringFromDate(startTime)
            }
            
            if let endTime = activity["endTime"] as? NSDate {
                activityCell.endTimeLabel.text = dateFormat.stringFromDate(endTime)
            }
            
            if let file = activity["image"] as? PFFile {
                file.getDataInBackgroundWithBlock{ data, error in
                    if (error != nil){
                        
                        return
                    }
                    
                    if let newData = data{
                        print("imagehere")
                        activityCell.activityImage.image = UIImage(data: newData)
                    }
                }
            }
        }
        return cell
    }
    
    // deleting function
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            activities.removeAtIndex(indexPath.row).deleteInBackgroundWithBlock({ (success, error: NSError?) -> Void in
                if (error != nil) {
                    print(error)
                } else {
                    print("Activity Deleted!")
                }
            })
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
}

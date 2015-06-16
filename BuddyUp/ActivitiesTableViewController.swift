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
    var dateStyle = NSDateFormatterStyle.MediumStyle

    override func viewDidLoad() {
        super.viewDidLoad()
        var query = PFQuery(className: "Activity")
        query.whereKey("creator", equalTo: PFUser.currentUser()!.username!)
        var activities = query.findObjects()
        if let activity = activities {
            for activity in activities! {
                activitesTypeArray.append(activity["activityType"] as! String)
                println(activity["activityType"] as! String)
                startTimeArray.append(activity["startTime"] as! NSDate)
                println(activity["startTime"] as! NSDate)
                endTimeArray.append(activity["endTime"] as! NSDate)
                println(activity["endTime"] as! NSDate)
                
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
        return activitesTypeArray.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cellStyleFactory(indexPath)
    }


    func cellStyleFactory (indexPath: NSIndexPath) -> UITableViewCell {
        var cellType = "ActivityCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellType, forIndexPath: indexPath) as! UITableViewCell
        if let activityCell = cell as? ActivityTableViewCell {
            let dateFormat = NSDateFormatter()
            dateFormat.dateStyle = NSDateFormatterStyle.MediumStyle
            dateFormat.timeStyle = NSDateFormatterStyle.ShortStyle
            activityCell.activityTypeLabel.text = activitesTypeArray[indexPath.row]
            activityCell.startTimeLabel.text = dateFormat.stringFromDate(startTimeArray[indexPath.row])
            activityCell.endTimeLabel.text = dateFormat.stringFromDate(endTimeArray[indexPath.row])
                }
        // Configure the cell...
        
        return cell
    }
}

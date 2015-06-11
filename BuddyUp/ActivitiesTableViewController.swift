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
            activityCell.activityTypeLabel.text = activitesTypeArray[indexPath.row]
        }
        // Configure the cell...
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

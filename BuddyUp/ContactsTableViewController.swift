//
//  ContactsTableViewController.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-10-14.
//  Copyright © 2015 Yung Dai. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
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
        if let _ = users {
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
    
    // MARK: - Segment Control
    
    @IBAction func friendshipSegmentChanged(sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            print("Friends Selected")
        case 1:
            print("Find Friends Selected")
        default:
            break;
        }
    }
   
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

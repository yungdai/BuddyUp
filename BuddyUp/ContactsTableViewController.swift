//
//  ContactsTableViewController.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-10-14.
//  Copyright © 2015 Yung Dai. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!

    var searchActive: Bool = false
    var filtered: [PFObject] = []
    var userArray: [PFObject] = []
    var contactsSection: Int = 1
    var addFriendsButton: UIBarButtonItem!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            print("Friends Selected")
        case 1:
            print("Find Friends Selected")
            search()
        default:
            break;
        }
        
        
        // set up the refresh controls for this table
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("sortArray"), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl
        
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        switch segmentControl.selectedSegmentIndex {
        case 0:
            print("Friends Selected")
            contactsSection = 1
            self.navigationItem.rightBarButtonItem!.title = ""
 
        case 1:
            print("Find Friends Selected")
            contactsSection = 1
            self.navigationItem.rightBarButtonItem!.title = "Add Friends"
            print("changed")
 
        default:
            break;
        }
        
        return contactsSection
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return userArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellName: String!
        
        // change the cell information based on thw segment control
        switch segmentControl.selectedSegmentIndex {
        case 0:
            print("Friends Selected")
            cellName = "friendsCell"
        case 1:
            print("Find Friends Selected")
            cellName = "findFriends"
           
        default:
            break;
        }
        
        // deque the cell information
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellName, forIndexPath: indexPath)

        // make sure that when you select the cell it doesn't have a style
        cell.selectionStyle = .None
        
        
        if let friendshipCell = cell as? UserTableViewCell {
            let user = userArray[indexPath.row]
            
            if let name = user["name"] as? String {
                friendshipCell.name.text = name
            }
            
            if let userPicture = user["photo"] as? String {
                
                // parse the photo URL into data for the UIImageView
                friendshipCell.userImage.image = friendshipCell.userImage.downloadImage(userPicture)
                
                
            } else if let userPicture = user["userImage"] as? PFFile {
                userPicture.getDataInBackgroundWithBlock({ (data, error: NSError?) -> Void in
                    if (error != nil) {
                        print("There was an error: \(error)")
                        // TODO throw error message
                        return
                    }
                    // get the image data
                    if let newData = data {
                        friendshipCell.userImage.image = UIImage(data: newData)
                    }
                    
                })
            }
            

        }
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
    
    // MARK: - Search Controls 
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        // stop searching if you stop typing
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        //
        searchActive = false;
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        // as you type you should be able to search at the same time and pull in data with this method
        search(searchText)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        // stop searching if you click the cancel button
        searchActive = false;
        
        // Clear any search criteria
        searchBar.text = ""
        
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
        
        // Force reload of table data
        self.tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    // searching function
    func search(searchText: String? = nil){
        // query the User object
        let query = PFUser.query()
        
        // search the name column for the text containing the string
        if(searchText != nil){
            query!.whereKey("name", containsString: searchText)
        }

        query!.findObjectsInBackgroundWithBlock { (result: [AnyObject]?, error: NSError?) -> Void in
            if (error != nil) {
                print(error)
            }
            
            self.userArray = (result as? [PFObject])!
            print("found something", terminator: "")
            self.tableView.reloadData()
            
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

    
    // MARK: - Adding Friends
    
    private func addFriend() {
        
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        // change the cell information based on thw segment control
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

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
    var filtered: [PFObject]? = []
    var userArray: [PFUser]? = []
    var contactsSection: Int = 1
    var addFriendsButton: UIBarButtonItem!
    var currentFriendIndex: NSIndexPath?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            print("Friends Selected")
        case 1:
            print("Find Friends Selected")
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
        
        return contactsSection
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return userArray!.count
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
            let user = userArray![indexPath.row]
            
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
            
            self.userArray = (result as? [PFUser])!
            print("found something", terminator: "")
            self.tableView.reloadData()
            
        }
    }
    
    func sortArray() {
        let sortedAlphabetically = Array(userArray!.reverse())
        for(index,element) in sortedAlphabetically.enumerate() {
            userArray![index] = element
        }
        
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
  
    // MARK: - Adding Friends
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        
        // adding a normal status for this for now, might need it to be destructive later
    
        let addFriend = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Add Friend") { (action: UITableViewRowAction, indexPath: NSIndexPath) -> Void in
            
            // review the tableview cell back to normal
            self.editing = false
            
            self.requestFriendship(indexPath)
            
        }
        
        // change the backgroound colour of the swipe
        addFriend.backgroundColor = UIColor.yellowColor()
        
        return [addFriend]
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        // change the cell information based on thw segment control
//        switch segmentControl.selectedSegmentIndex {
//        case 0:
//            print("Friends Selected")
//            
//        case 1:
//            print("Find Friends Selected")
//            
//            let optionMenu = UIAlertController(title: "", message: "Request Freindship with User?", preferredStyle: .ActionSheet)
//            let addFriendAction = UIAlertAction(title: "Yes", style: .Default, handler: { (alert: UIAlertAction) -> Void in
//                self.requestFriendship(indexPath)
//            })
//            
//            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (alert: UIAlertAction) -> Void in
//                print("Cancelled Action")
//            })
//            
//            // make it work on an iPad
//            optionMenu.popoverPresentationController?.sourceView = tableView.cellForRowAtIndexPath(indexPath)! as UIView
//            optionMenu.addAction(addFriendAction)
//            optionMenu.addAction(cancelAction)
//            
//            presentViewController(optionMenu, animated: true, completion: nil)
//            
//        default:
//            break;
//        }
//    }
    
    func requestFriendship(index: NSIndexPath) {
        
        if let users = userArray {
            // get the selection user's in their row
            let friend: PFUser = users[index.row] as PFUser

            
            let selectedFriend: PFUser = friend["objectID"] as! PFUser
            
            // create the friendshipRequest
            let friendship = PFObject(className: "Friendship")
            
            // the friendship asker
            friendship.setObject(PFUser.currentUser()!, forKey: "user")
            friendship.setObject(selectedFriend as PFUser!, forKey: "friend")
            friendship.setObject(NSDate(), forKey: "date")
            friendship["relationshipStatus"] = "Pending"
            friendship["requester"] = true
            friendship.saveInBackground()
            
            // the friendship reciever
            friendship.setObject(selectedFriend as PFUser!, forKey: "user")
            friendship.setObject(PFUser.currentUser()!, forKey: "friend")
            friendship.setObject(NSDate(), forKey: "date")
            friendship["relationshipStatus"] = "Pending"
            friendship["requester"] = false
            friendship.saveInBackground()
        }
        
    }
}
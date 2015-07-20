//
//  SearchTableViewController.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-07-01.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

class SearchTableViewController: PFQueryTableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    var searchActive: Bool = false
    var data: [PFObject]!
    var filtered: [PFObject]!
    var userArray: [PFObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self

        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        search()
    }
    
    func search(searchText: String? = nil){
        // query the User object
        let query = PFQuery(className: "User")
        
        // search the name colum for the text containing the string
        if(searchText != nil){
            query.whereKey("name", containsString: searchText)
        }
        query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
            self.data = results as? [PFObject]
            print("found something")
            // if you find the data the reload the screen
            self.tableView.reloadData()
        }
        
    }
    
    // Define the query that will provide the data for the table view
    
    override func queryForTable() -> PFQuery {
        search()
        // Start the query object
        var query = PFUser.query()
        
        // Add a where clause if there is a search criteria
        if searchBar.text != "" {
            query!.whereKey("name", containsString: searchBar.text.lowercaseString)
        }
        
        // Order the results
        query!.orderByAscending("name")
        
        // Return the qwuery object
        return query!
        
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the appropriate cells based on how many the search finds
        if(data !=  nil) {
            return self.data.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let obj = self.data[indexPath.row]
        cell.textLabel!.text = obj["name"] as? String
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        // Refresh the table to ensure any data changes are displayed
        tableView.reloadData()
        
        // Delegate the search bar to this table view class
        searchBar.delegate = self
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        // stop searching if you stop typing
        searchActive = false;
        
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
        
        // Force reload of table data
        self.loadObjects()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        //
        searchActive = false;

        
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
        
        // Force reload of table data
        self.loadObjects()
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
        self.loadObjects()
    }
    
  
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
}

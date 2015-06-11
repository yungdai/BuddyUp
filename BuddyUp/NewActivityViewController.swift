//
//  NewActivityViewController.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-06-09.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

class NewActivityViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    

    @IBOutlet weak var activityPicker: UIPickerView!
    @IBOutlet weak var startTimePicker: UIDatePicker!
    @IBOutlet weak var endTimePicker: UIDatePicker!
    
    var selectedActivity = String()

    
    
    let activities = ["Watch TV", "Go For Drinks", "Play Sports", "Watch a Movie", "Go To An Event"]
    

    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        activityPicker.dataSource = self
        activityPicker.delegate = self
        selectedActivity = activities[0]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonPressed(sender: UIBarButtonItem) {
        var activity = PFObject(className: "Activity")
        activity["creator"] = PFUser.currentUser()?.username
        activity["name"] = PFUser.currentUser()?.objectForKey("name")
        activity["startTime"] = startTimePicker.date
        activity["endTime"] = endTimePicker.date
        activity["activityType"] = selectedActivity
        
        activity.save()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activities.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return activities[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var picked = activities[row]
        selectedActivity = picked
        
    }

}

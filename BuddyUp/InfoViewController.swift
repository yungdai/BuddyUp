//
//  InfoViewController.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-10-13.
//  Copyright © 2015 Yung Dai. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    // setup the background from the previous view
    var background: UIImage = UIImage()
    var currentActivityIndex: Int = Int()
    var activities: [PFObject]?
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var userImage: PictureImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var startTimeLabelText: UILabel!
    @IBOutlet weak var endTimeLabelText: UILabel!
    @IBOutlet weak var activityTypeImage: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup and imageview for the background
        backgroundImage.image? = background
        
        // load in the current activity into the screen
        activityInfo()

        // Do any additional setup after loading the view.
    }
    
    func activityInfo() {
        if let currentActivity = activities {
            let activity = currentActivity[currentActivityIndex]
            
            let dateFormat = NSDateFormatter()
            dateFormat.dateStyle = .MediumStyle
            dateFormat.dateStyle = .ShortStyle
            
            if let activityType = activity["activityType"] as? String {
                self.activityLabel.text = activityType
            }
            
            if let startTime = activity["startTime"] as? NSDate {
                self.startTimeLabelText.text = dateFormat.stringFromDate(startTime)
            }
            
            if let endTime = activity["endTime"] as? NSDate {
                self.endTimeLabelText.text = dateFormat.stringFromDate(endTime)
            }
            
            if let creatorName = activity["name"] as? String {
                self.userName.text = creatorName
            }
            
            if let activityImage = activity["image"] as? PFFile {
                activityImage.getDataInBackgroundWithBlock({ (data, error: NSError?) -> Void in
                    if (error != nil) {
                        print(error)
                        // TODO throw error message
                        return
                    }
                    
                    if let newData = data {
                        self.activityTypeImage.image = UIImage(data: newData)
                    }
                })
            }
            
            if let activityOwner = activity["createdBy"]?.objectForKey("userImage") as? PFFile {
                activityOwner.getDataInBackgroundWithBlock({ (data, error: NSError?) -> Void in
                    if (error != nil) {
                        print(error)
                        return
                    }
                    
                    if let newData = data {
                        self.userImage.image = UIImage(data: newData)
                    }
                })
            }
        }
    }

    @IBAction func doneButtonPressed(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}

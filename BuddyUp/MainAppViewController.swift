//
//  MainAppViewController.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-06-08.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

class MainAppViewController: UIViewController{
    
    let currentUser = PFUser.currentUser()
    let iPhoneImageDimension:CGFloat = 100.0
    let iPadImageDimension:CGFloat = 145.0
    

    
    @IBOutlet var personImage: UIImageView!
    @IBOutlet var personLabelText: UILabel!
    @IBOutlet var activityTypeLabelText: UILabel!
    @IBOutlet var startTimeLabelText: UILabel!
    @IBOutlet var endTimeLabelText: UILabel!
    @IBOutlet var activityTypeImage: UIImageView!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var crossButton: UIButton!
    @IBOutlet var activityCardBackground: ActivityCardView!
    var currentActivityIndex = -1
    // activities parse object
    var activities: [PFObject]?
    var currentUserID: String?
    
    // location setup
    var currentLocation: PFGeoPoint?
    
    // card movement
    enum CardSelectionState {
        case NoSelection
        case MakingSelection
        case SwipingLeft
        case SwipingRight
        case SwipedLeft
        case SwipedRight
    }
    
    var cardSelectionState: CardSelectionState = .NoSelection
    
    
    // activity picture
    enum ActivityPicture {
        case WatchTV
        case GoFoDrinks
        case PlaySports
        case WatchAMovie
        case GoToAnEvent
        case CustomPicture
        case NoImage
    }
    
    var activityPictureSource: ActivityPicture = .NoImage
    
    // user image
    
    enum UserImage {
        case FacebookImage
        case CustomImage
        case NoImage
    }
    
    var userImageType: UserImage = .NoImage
    

    var frame: CGRect!
    var xFromCenter: CGFloat = 0
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some setup 
        // get the current location and sent to Parse
        
        PFGeoPoint.geoPointForCurrentLocationInBackground { (geoPoint:PFGeoPoint?, error:NSError?) -> Void in if let user = PFUser.currentUser() {
            if (error != nil) {
                
            }
            self.currentLocation = geoPoint
            if let currentLocation = self.currentLocation {
                
            }
            //            user["currentLocation"] = geoPoint
            //            user.saveInBackground()
            //            self.checkForMatches(self.currentMatchIndex, aroundGeopoint: geoPoint!)
            }
            
        }

        
        frame = CGRectZero
        
        getActivites()
        

    
    }
    
    func getActivites() {
        // get all Activity Objects that aren't yours
        var query = PFQuery(className: "Activity")
        query.whereKey("creator", notEqualTo: PFUser.currentUser()!.username!)
        
        
        
        // getting the data asynchronusly in the background
        query.findObjectsInBackgroundWithBlock { (result: [AnyObject]?, error: NSError?) -> Void in
            
            if (error != nil) {
                
            } else {
                return
            }
            
            if let fetchedActivities = result as? [PFObject] {
                self.activities = fetchedActivities
                self.styleForNextActivity()
            }
        }
    }
    
    
    func styleForNextActivity() {
        if let currentActivities = activities {
            currentActivityIndex++
            if  currentActivityIndex >= currentActivities.count && currentActivities.count > 1 {
                currentActivityIndex = 0
            }
            let activity = currentActivities[currentActivityIndex]
            let dateFormat = NSDateFormatter()
            dateFormat.dateStyle = NSDateFormatterStyle.MediumStyle
            dateFormat.timeStyle = NSDateFormatterStyle.ShortStyle
            if let activityType = activity["activityType"] as? String {
                self.activityTypeLabelText.text = activityType
            }
            
            if let startTime = activity["startTime"] as? NSDate {
                self.startTimeLabelText.text = dateFormat.stringFromDate(startTime)
            }
            
            if let endTime = activity["endTime"] as? NSDate {
                self.endTimeLabelText.text = dateFormat.stringFromDate(endTime)
            }
            
            if let creatorName = activity["name"] as? String {
                self.personLabelText.text = creatorName
            }
            
            if let activityImage = activity["image"] as? PFFile {
                activityImage.getDataInBackgroundWithBlock({ (data, error: NSError?) -> Void in
                    if (error != nil) {
                        println(error)
                        // TODO throw error message
                        return
                    }
                    
                    if let newData = data {
                        self.activityTypeImage.image = UIImage(data: newData)
                    }
                    
                })
            }
            if let userID = activity["createdBy"] as? String {
                self.currentUserID = userID
            }
        }
    }
    
    func getUserImage() {
        
        // get all Activity Objects that aren't yours
        var query = PFUser.query()
        query?.whereKey(currentUserID!, equalTo: "objectId")
        
        // getting the data asynchronusly in the background
//        query.findObjectsInBackgroundWithBlock({ (result: PFObject?, error: NSError?) -> Void in
//            
//            if (error != nil) {
//                
//            } else {
//                return
//            }
//            
//            if let user = result {
//                // take and display the facebook image URL
//                if let userPicture = user["photo"] as? String {
//                    
//                    // parse the photo URL into data for the UIImageView
//                    self.personImage.image = self.personImage.downloadImage(userPicture)
//                    
//                    // old code
//                    //                    // parse the photo URL into data for the UIImageView
//                    //                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), { () -> Void in
//                    //                        let data = NSData(contentsOfURL: NSURL(string: userPicture)!)
//                    //                        dispatch_sync(dispatch_get_main_queue(), { () -> Void in
//                    //                            self.userImageView.image = UIImage(data: data!)
//                    //                        })
//                    //                    })
//                    
//                } else if let userPicture = user["userImage"] as? PFFile {
//                    userPicture.getDataInBackgroundWithBlock({ (data, error: NSError?) -> Void in
//                        if (error != nil) {
//                            println(error)
//                            // TODO throw error message
//                            return
//                        }
//                        
//                        if let newData = data {
//                            self.personImage.image = UIImage(data: newData)
//                        }
//                        
//                    })
//                }
//            }
//        })
        
        //TODO: Get user image


        
    }
    
    @IBAction func activityCardWasDragged(sender: UIPanGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.Began {
            frame = sender.view?.frame
            
        }
        
        let translation = sender.translationInView(self.view)
        
        // get dragging information
        var profile = sender.view!
        xFromCenter += translation.x
        var scale = min(100 / abs(xFromCenter), 1)
        
        // remove the translation along the Y access so it only moves left and right
        profile.center = CGPoint(x: profile.center.x + translation.x, y: profile.center.y)
        
        // resetting translation when the card is let go
        sender.setTranslation(CGPointZero, inView: self.view)
        
        // rotate the label/image
        var rotation: CGAffineTransform = CGAffineTransformMakeRotation(translation.x / 200)
        
        // check for the movement along the x/y access and return the state of the card
        if profile.center.x < 100 {
            //not chosen
            cardSelectionState = .SwipingLeft
            
            if profile.center.x < 20 {
                cardSelectionState = .SwipedLeft
            }
        } else {
            // chosen
            
            cardSelectionState = .SwipingRight
            
            if profile.center.x > 300 {
                cardSelectionState = .SwipedRight
            }
            
        }
        
        // once the gesture state has ended
        if sender.state == UIGestureRecognizerState.Ended {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                profile.frame = self.frame
                }, completion: {
                    (completed) -> Void in
                    if (completed) {
                        
                        switch self.cardSelectionState {
                        case .NoSelection:
                            println("No Selection")
                            
                        case .MakingSelection:
                            println("Making Selection")
                            
                        case .SwipingLeft:
                            println("Swiping Left")
                            
                        case .SwipedLeft:
                            println("Swiped Left")
                            
                        case .SwipingRight:
                            println("Swiping Right")
                            
                        case .SwipedRight:
                            println("Swiped RIght")
                            
                        }
                        self.cardSelectionState = .NoSelection
                    }
            })
        }
        // TODO: load next Image

    }
    

    @IBAction func checkButtonPushed(sender: UIButton) {
        styleForNextActivity()
        
    }
    
    
    
    @IBAction func crossButtonPushed(sender: UIButton) {
        styleForNextActivity()
    }
}


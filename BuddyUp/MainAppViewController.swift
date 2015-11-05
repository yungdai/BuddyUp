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
    let iPhoneImageDimension: CGFloat = 100.0
    let iPadImageDimension: CGFloat = 145.0
    
    @IBOutlet var personImage: UIImageView!
    @IBOutlet var personLabelText: UILabel!
    @IBOutlet var activityTypeLabelText: UILabel!
    @IBOutlet var startTimeLabelText: UILabel!
//    @IBOutlet var endTimeLabelText: UILabel!
    @IBOutlet var activityTypeImage: UIImageView!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var crossButton: UIButton!
    @IBOutlet var activityCardBackground: ActivityCardView!
    var currentActivityIndex = -1
    // activities parse object
    var activities: [PFObject]?
    var currentUserID: String?
    
    // like boolean

    
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
    // TODO do fast enum based on the picture
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
                        user["currentLocation"] = geoPoint
                        user.saveInBackground()
            }
            
        }

        frame = CGRectZero

        if PFUser.currentUser()?.sessionToken != nil {
            // get all Activity Objects that aren't yours
            let query = PFQuery(className: "Activity")
            query.includeKey("createdBy")
            query.whereKey("createdBy", notEqualTo: PFUser.currentUser()!)
            
            
            // getting the data asynchronusly in the background
            query.findObjectsInBackgroundWithBlock { (result: [AnyObject]?, error: NSError?) -> Void in
                
                if (error != nil) {
                    
                }
                
                if let fetchedActivities = result as? [PFObject] {
                    self.activities = fetchedActivities
                    self.styleForNextActivity()
                }
            }
        } else {
            // Show the signup or login screen
            return
        }
    }
    
    func getActivites() {
        // get all Activity Objects that aren't yours
        let query = PFQuery(className: "Activity")
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
            
//            if let endTime = activity["endTime"] as? NSDate {
//                self.endTimeLabelText.text = dateFormat.stringFromDate(endTime)
//            }
            
            if let creatorName = activity["name"] as? String {
                self.personLabelText.text = creatorName
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
                        self.personImage.image = UIImage(data: newData)                    }
                })
                
            }
            
            
        }
    }
    
    
    @IBAction func activityCardWasDragged(sender: UIPanGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.Began {
            frame = sender.view?.frame
            
        }
        
        let translation = sender.translationInView(self.view)
        
        // get dragging information
        let profile = sender.view!
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
                            print("No Selection")
                            
                        case .MakingSelection:
                            print("Making Selection")
                            
                        case .SwipingLeft:
                            print("Swiping Left")
                            
                        case .SwipedLeft:
                            print("Swiped Left")
                            
                        case .SwipingRight:
                            print("Swiping Right")
                            
                        case .SwipedRight:
                            print("Swiped RIght")
                            
                        }
                        self.cardSelectionState = .NoSelection
                    }
            })
        }
        // TODO: load next Image

    }
    
    func likedActivity() {
        
        if let currentActivities = activities {
            let currentActivity = currentActivities[currentActivityIndex]
            
            // activity ID object ID pointer value
            let currentActivityId = PFObject(withoutDataWithClassName:"Activity", objectId: currentActivity.objectId)
            
            // activity user creator pointer from User Class
            let currentActivityCreator: PFUser = currentActivity["createdBy"] as! PFUser

            // save the data for liked activity
            let likedActivity = PFObject(className: "Liked")
            likedActivity["activityID"] = currentActivityId
            likedActivity["activityLikeUser"] = PFUser.currentUser()
            likedActivity["activityID"] = currentActivityId
            likedActivity["activityOwner"] = currentActivityCreator
            
            
            // save the liked activity in background
            likedActivity.saveInBackgroundWithBlock({ (success, error: NSError?) -> Void in
                if (error != nil) {
                    //TODO: Set up Alert
                    print(error)
                    
                } else {
                    print("liked activity added")
                }
            })
        }
    }
    

    @IBAction func checkButtonPushed(sender: UIButton) {
        likedActivity()
        styleForNextActivity()
        
    }
    
    
    
    @IBAction func crossButtonPushed(sender: UIButton) {
        styleForNextActivity()
    }
    
    // show the more info screen

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "activityInfo" {
            // set up the info viewController
            let infoViewController: InfoViewController = segue.destinationViewController as! InfoViewController
            
            // take a screenshot of the currrent viewcontroller and change it to UIImage
            let screenshot: UIImage = takeScreenshot()
            
            // take the screenshot and apply the blur to it
            let ciimage: CIImage = CIImage(image: screenshot)!
            let filter: CIFilter = CIFilter(name: "CIGaussianBlur")!
            
            
            // initialising the filter for the CIGaussianBlur
            filter.setDefaults()
            filter.setValue(ciimage, forKey: kCIInputImageKey)
            
            // this is the value for how much blurring, you can edit the integer value
            filter.setValue(30, forKey: kCIInputRadiusKey)
            
            // apply the final output image
            let outputImage: CIImage = filter.outputImage!
            let finalImage: UIImage = UIImage(CIImage: outputImage)
            
            infoViewController.background = finalImage
            
            UIGraphicsEndImageContext()
            
            
            // Get the new view controller using [segue destinationViewController].
            // Pass the selected object to the new view controller.
        }
        
    }
    
    // function to take the screenshot
    
    func takeScreenshot() -> UIImage{
        
        let layer = UIApplication.sharedApplication().keyWindow?.layer
        let scale = UIScreen.mainScreen().scale
        UIGraphicsBeginImageContextWithOptions(layer!.frame.size, false, scale);
        
        layer!.renderInContext(UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        print("Taking Screenshit")
        return screenshot
    }
}


//
//  LoginViewController.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-06-05.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    // var mainAppViewController = MainAppViewController()

    
    let permissions = ["public_profile", "email", "user_friends"]
    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        processFieldEntries()
        
    }
    
    func processFieldEntries() {
        let username = usernameField.text
        let password = passwordField.text
        let noUsernameText = " username"
        let noPasswordText = " password"
        var errorText = "No"
        let errorTextJoin = " or "
        let errorTextEnding = " entered"
        var textError:Bool = false
        
        // Messaging nil will return 0, so these checks impicity check for nil text.
        
        if count(username) == 0 || count(password) == 0 {
            textError = true
            
            // set up the keyboard for the first field missing input
            if count(password) == 0 {
                passwordField.becomeFirstResponder()
            }
            
            if count(username) == 0 {
                usernameField.becomeFirstResponder()
            }
        }
        
        // if the username entered text box lenth is 0
        if count(username) == 0 {
            textError = true
            errorText += noUsernameText
        }
        
        if count(password) == 0 {
            textError = true
            if count(username) == 0 {
                errorText += errorTextJoin
            }
            errorText += noPasswordText
        }
        
        
        // present a popup to alert that there was an error
        if textError {
            errorText += errorTextEnding
            errorMessage.text = errorText
            let alert = UIAlertController(title: "Alert", message: errorText, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        // log in the user with Parse
        PFUser.logInWithUsernameInBackground(username, password: password) {
            (user: PFUser?, error: NSError?) -> Void in
            
            // check for email verification
            if user!["emailVerified"] as! Bool == true {
                dispatch_async(dispatch_get_main_queue()) {
                    self.performSegueWithIdentifier(
                        "mainApp",
                        sender: self
                    )
                    // save the user's location to parse before you save the information
                    PFGeoPoint.geoPointForCurrentLocationInBackground { (geoPoint:PFGeoPoint?, error:NSError?) -> Void in
                        if let user = PFUser.currentUser() {
                            user["currentLocation"] = geoPoint
                            user.saveInBackground()
                        }
                        println("user is logged in and location is updated")
                    }
                    self.performSegueWithIdentifier("mainApp", sender: nil)
                }
            } else {
                // User needs to verify email address before continuing
                let alertController = UIAlertController(
                    title: "Email address verification",
                    message: "We have sent you an email that contains a link - you must click this link before you can continue.",
                    preferredStyle: UIAlertControllerStyle.Alert
                )
                alertController.addAction(UIAlertAction(title: "OKAY",
                    style: UIAlertActionStyle.Default,
                    handler: { alertController in self.processSignOut()})
                )
                // Display alert
                self.presentViewController(
                    alertController,
                    animated: true,
                    completion: nil
                )
            }
            
            // check for error messages
            if error != nil {
                // save the user's location to parse before you save the information
                PFGeoPoint.geoPointForCurrentLocationInBackground { (geoPoint:PFGeoPoint?, error:NSError?) -> Void in
                    if let user = PFUser.currentUser() {
                        user["currentLocation"] = geoPoint
                        user.saveInBackground()
                    }
                println("user is logged in and location is updated")
                }
                self.performSegueWithIdentifier("mainApp", sender: nil)
                
            } else {
                println("log in failed")
                self.errorMessage.text = "Log in failed"
                return
            }
        }
    }
    
    // Sign the current user out of the app
    func processSignOut() {
        
        // // Sign out
        PFUser.logOut()
        
        // Display sign in / up view controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewControllerWithIdentifier("Login") as! UIViewController
        self.presentViewController(viewController, animated: true, completion: nil)
    }

    
    @IBAction func signupButtonPressed(sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if PFUser.currentUser()?.sessionToken != nil {
            println("sending user to the main app screen because he's a current user")
            
            self.performSegueWithIdentifier("mainApp", sender: self)
        } else {
            // Show the signup or login screen
            return
        }
        
        
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            println("User is already logged in go to the next viewcontroller")
            
        }// Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func facebookButton
        (sender: AnyObject) {
            self.errorMessage.alpha = 0
            
            PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions as [AnyObject]) {
                (user: PFUser?, error: NSError?) -> Void in
                
                if error != nil
                {
                    return;
                }
                if let parseUser = user {
                    if parseUser.isNew {
                        println("User signed up and logged in through Facebook!")
                        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "/me?fields=first_name,friends,gender,email,name,picture.width(300).height(300)", parameters: nil)
                        graphRequest.startWithCompletionHandler({
                            (connection, result, error) -> Void in
                            if (error != nil)
                            {
                                // display the error message
                                println("Error: \(error)")
                            } else {
                                // parsing the facebook data from the graph API and saving it to parse
                                // save the facebook name and email data to parseUser
                                parseUser["name"] = result["name"]
                                parseUser["email"] = result["email"]
                                parseUser["first_name"] = result["first_name"]
                                parseUser["gender"] = result["gender"]
                                

                                // sending the facebook picture to parse as a string
                                if let pictureResult = result["picture"] as? NSDictionary,
                                    pictureData = pictureResult["data"] as? NSDictionary,
                                    picture = pictureData["url"] as? String {
                                        parseUser["photo"] = picture
                                        
                                }
                                
                                // save the user's location to parse before you save the information
                                PFGeoPoint.geoPointForCurrentLocationInBackground { (geoPoint:PFGeoPoint?, error:NSError?) -> Void in
                                    if let user = PFUser.currentUser() {
                                        user["currentLocation"] = geoPoint
                                        user.saveInBackground()
                                    }
                                }
                                parseUser.saveInBackground()
                                println("Parse User Saved")
                                self.performSegueWithIdentifier("mainApp", sender: nil)
                            }
                        })
                    } else {
                        println("You are already a user, I'll just send you the main page")
                        // save the user's location to parse before you save the information
                        PFGeoPoint.geoPointForCurrentLocationInBackground { (geoPoint:PFGeoPoint?, error:NSError?) -> Void in
                            if let user = PFUser.currentUser() {
                                user["currentLocation"] = geoPoint
                                println("Saving User's Location In Background")
                                user.saveInBackground()
                            }
                            
                        }
                        self.performSegueWithIdentifier("mainApp", sender: nil)
                    }
                }
            }
    }
}

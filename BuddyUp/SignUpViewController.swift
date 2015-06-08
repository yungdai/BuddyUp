//
//  SignUpViewController.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-06-05.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordConfirmationField: UITextField!
    @IBOutlet weak var emailAddressField: UITextField!

    @IBAction func createAccountButtonPressed(sender: UIButton) {
        
        // setup the fields for the sign up page
        let username = usernameField.text
        let password = passwordField.text
        let passwordConfirmation = passwordConfirmationField.text
        let emailAddress = emailAddressField.text
        
        var errorText = "Please "
        let usernameBlankText = "enter a username"
        let passwordBlankText = "enter a password"
        let emailBlankText = "eat an email address"
        let jointText = ", and "
        let passwordMismatchText = "enter the same password twice"
        
        var textError = false
        
        
        // Messaging nil will return 0, so these checks implicitly check for nil text.
        if count(username) == 0 || count(password) == 0 || count(passwordConfirmation) == 0 {
            textError = true
            
            // Set up the keyboard for the first field missing input:
            if count(username) == 0 {
                usernameField.becomeFirstResponder()
            }
            
            if count(password) == 0 {
                passwordField.becomeFirstResponder()
            }
            
            if count(passwordConfirmation) == 0 {
                passwordConfirmationField.becomeFirstResponder()
            }

            if count(emailAddress) == 0 {
                emailAddressField.becomeFirstResponder()
            }
            
            // error text feedback
            if count(username) == 0 {
                errorText += usernameBlankText
            }
            
            if count(password) == 0 || count(passwordConfirmation) == 0 {
                if count(username) == 0 {
                    // we need some joining text in the error
                    errorText += jointText
                }
                errorText += passwordBlankText
            }
            
            if count(emailAddress) == 0 {
                errorText += emailBlankText
            }
            
        } else if password != passwordConfirmation {
            textError = true
            errorText += passwordMismatchText
            passwordField.becomeFirstResponder()
        }
        
        // present a popup if there was an error
        if textError {
            let alert = UIAlertController(title: "Alert", message: errorText, preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        // if those conditions clear you will create a new user and log in
        
        var parseUser = PFUser()
        parseUser.username = usernameField.text
        parseUser.password = passwordField.text
        parseUser.signUpInBackgroundWithBlock({ (succeeded: Bool, error: NSError?) -> Void in
            
            if error == nil {
                println("signed up user to Parse")
                // send them over to the main app
                
            } else {
                println(error)
                self.usernameField.becomeFirstResponder()
                let alert = UIAlertController(title: "Alert", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.Alert)
                return
            }
        })
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func processFieldEntries() {
    
        
        
    }
}

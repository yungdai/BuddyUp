//
//  SettingsTableViewController.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-06-09.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailAddressTextField: UITextField!
    
    
    @IBAction func logoutButtonPressed(sender: UIButton) {
        PFUser.logOut()
        self.performSegueWithIdentifier("goToLogin", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PFUser.currentUser()?.fetchInBackgroundWithBlock({ (result: PFObject?, error: NSError?) -> Void in
           
            if let user = result {
                if let firstName = user["first_name"] as? String {
                    self.firstNameTextField.text = firstName
                }
                
                if let lastName = user["last_name"] as? String {
                    self.lastNameTextField.text = lastName
                }
                
                if let email = user["email"] as? String {
                    self.emailAddressTextField.text = email
                }
                
            }
        })
    }

    @IBAction func savePressed(sender: UIBarButtonItem) {
        resign()
        // REMEMBER TO WRAP YOUR VARIABLES IN IF LET's!!!!
        if let user = PFUser.currentUser() {
            user["first_name"] = firstNameTextField.text
            user["last_name"] = lastNameTextField.text
            let name = "\(firstNameTextField.text) \(lastNameTextField.text)"
            user["name"] = name
            user["email"] = emailAddressTextField.text
            
            user.saveInBackgroundWithBlock({ (sucess, error: NSError?) -> Void in
                if (error != nil) {
                    println(error)
                    
                } else {
                    // TODO: give response for saved data
                    println("saved")
                    
                }
            })
            
        }
    }
    
    
    // resign they keyboard
    func resign() {
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        emailAddressTextField.resignFirstResponder()
    }
}

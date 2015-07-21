//
//  NewActivityViewController.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-06-09.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

class NewActivityViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverPresentationControllerDelegate {
    
    var startDatePickerPopUp : DatePickerPopUp?
    var endDatePickerPopUp : DatePickerPopUp?
    var activityPickerPopUp : PickerViewPickerPopUp?
    
    @IBOutlet var addPictureButton: UIButton!
    @IBOutlet var startTimeTextField: UITextField!
    @IBOutlet var endTimeTextField: UITextField!
    @IBOutlet var activityTypeTextField: UITextField!
    var currentUser = PFUser.currentUser()

    @IBOutlet var activityImageView: PictureImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startDatePickerPopUp = DatePickerPopUp(forTextField: startTimeTextField)
        endDatePickerPopUp = DatePickerPopUp(forTextField: endTimeTextField)
        activityPickerPopUp = PickerViewPickerPopUp(forTextField: activityTypeTextField)
        startTimeTextField.delegate = self
        endTimeTextField.delegate = self
        activityTypeTextField.delegate = self
        imagePicker.delegate = self
        
    }
    
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if (textField == startTimeTextField) {
            // make sure that the keyboard doesn't show up when you tap the text field entry box
            resign()
            
            // format the date
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
            let initDate : NSDate? = dateFormatter.dateFromString(startTimeTextField.text!)
            
            // execute the callback
            let dataChangeCallBack : DatePickerPopUp.DatePickerPopUpCallBack = { (newDate : NSDate, forTextField : UITextField) ->() in forTextField.text = (newDate.ToDateMediumString() ?? "?") as String
            }
            
            startDatePickerPopUp!.pick(self, initDate: initDate, dataChanged: dataChangeCallBack)
            return false
            
        } else if (textField == endTimeTextField) {
            // make sure that the keyboard doesn't show up when you tap the text field entry box
            resign()
            
            // format the date
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
            let initDate : NSDate? = dateFormatter.dateFromString(endTimeTextField.text!)
            
            // execute the callback
            let dataChangeCallBack : DatePickerPopUp.DatePickerPopUpCallBack = { (newDate : NSDate, forTextField : UITextField) ->() in forTextField.text = (newDate.ToDateMediumString() ?? "?") as String
            }
            
            endDatePickerPopUp!.pick(self, initDate: initDate, dataChanged: dataChangeCallBack)
            return false
            
        } else if (textField == activityTypeTextField) {
            resign()
            let initString : String = activityTypeTextField.text!
            let dataChangedCallBack : PickerViewPickerPopUp.PickerViewPickerPopUpCallBack = {(newText : String, forTextField: UITextField) ->() in
                
                forTextField.text = newText
            }
            
            activityPickerPopUp!.pick(self, initString: initString, dataChanged: dataChangedCallBack)
            return false
            
        }else {
            return true
        }
    }
    
    
    func resign() {
        startTimeTextField.resignFirstResponder()
        endTimeTextField.resignFirstResponder()
        activityTypeTextField.resignFirstResponder()
    }
    
    @IBAction func saveButtonPressed(sender: UIBarButtonItem) {

        // format the date for the TextField's Text
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        let initStartDate : NSDate? = dateFormatter.dateFromString(startTimeTextField.text!)
        let initEndDate : NSDate? = dateFormatter.dateFromString(endTimeTextField.text!)
        
        // save the object in the background
        let activity = PFObject(className: "Activity")
        let user = PFUser.currentUser()
        activity["creator"] = PFUser.currentUser()?.username
        activity["name"] = PFUser.currentUser()?.objectForKey("name")
        activity["startTime"] = initStartDate
        activity["endTime"] = initEndDate
        activity["activityType"] = activityTypeTextField.text
        activity["image"] = PFFile(name: "image.jpg", data: UIImageJPEGRepresentation(activityImageView.image!, 0.5)!)
        activity["createdBy"] = PFUser.currentUser()
        
        // save the user activity
        activity.saveInBackgroundWithBlock { (success, error: NSError?) -> Void in
            if (error != nil) {
                // TODO: set up alert
                print(error)
            } else {
                self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
            }
            
            
        }
    }
 
    // image picker variables
    let imagePicker = UIImagePickerController()

    // choose from the library of photos
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        activityImageView.contentMode = .ScaleAspectFit
        activityImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage

    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func addPictureButtonPressed(sender: UIButton) {
        // pop up an acdtion sheet
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .ActionSheet)
        
        
        // select from photo library
        let photoLibrary = UIAlertAction(title: "Photo Library", style: .Default) { (alert: UIAlertAction!) -> Void in
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.imagePicker.allowsEditing = false
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
        
        let camera = UIAlertAction(title: "Use Camera", style: .Default) { (alert: UIAlertAction!) -> Void in
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            self.imagePicker.allowsEditing = false
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        
        // make it work on an iPad
        optionMenu.popoverPresentationController?.sourceView = sender as UIView
        
        optionMenu.addAction(photoLibrary)
        optionMenu.addAction(camera)
        optionMenu.addAction(cancelAction)
        
        presentViewController(optionMenu, animated: true, completion: nil)
        
    }
    

}

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
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var userImage: PictureImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var doneButton: UIBarButtonItem!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup and imageview for the background
        backgroundImage.image? = background

        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

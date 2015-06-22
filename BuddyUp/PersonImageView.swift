//
//  PersonImageView.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-06-21.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

@IBDesignable class PersonImageView: UIImageView {
    

    @IBInspectable var cornerRounding: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRounding
            
        }
    }
    
    @IBInspectable var personBorderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = personBorderWidth

        }
    }
    
 
    @IBInspectable var personBorderColour: UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = personBorderColour.CGColor
        }
    }
    
    
    override func prepareForInterfaceBuilder() {
        personImageStyle()
    }
    
    override func awakeFromNib() {
        personImageStyle()
    }
    
     func personImageStyle() {
        layer.cornerRadius = cornerRounding
        layer.borderWidth = personBorderWidth
        layer.borderColor = personBorderColour.CGColor
        // binds the masking to the variables above.  This will be true for all images assigned in IB
        layer.masksToBounds = true
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

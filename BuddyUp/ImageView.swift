//
//  PersonImageView.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-06-21.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

@IBDesignable class ImageView: UIImageView {
    
    // set corner rouding in IB
    @IBInspectable var cornerRounding: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRounding
            
        }
    }
    
    // set border width in IB
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = borderWidth

        }
    }
    
    // set image in IB
    @IBInspectable var imageFile: UIImage? {
        didSet {
            layer.contents = imageFile?.CGImage
        }
    }
 
    @IBInspectable var borderColour: UIColor? {
        didSet {
            layer.borderColor = borderColour?.CGColor
        }
    }
    
    
    override func prepareForInterfaceBuilder() {
        imageStyle()
    }
    
    override func awakeFromNib() {
        imageStyle()
    }
    
     func imageStyle() {
        layer.cornerRadius = cornerRounding
        layer.borderWidth = borderWidth
        layer.borderColor = borderColour?.CGColor
        layer.contents = imageFile!.CGImage
        // binds the masking to the variables above.  This will be true for all images assigned in IB
        layer.masksToBounds = true
    }

}

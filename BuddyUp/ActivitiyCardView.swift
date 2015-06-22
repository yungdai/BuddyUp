//
//  ColorBlockView.swift
//  IBDesignableTest
//
//  Created by Yung Dai on 2015-06-21.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

@IBDesignable class ActivityCardView: UIView  {
    

    
    @IBInspectable var blockColour: UIColor = UIColor.grayColor() {
        didSet {
            backgroundColor = blockColour
        }
    }
    
    @IBInspectable var activityCardBorderWidth: CGFloat  = 1 {
        didSet {
            layer.borderWidth = activityCardBorderWidth
        }
    }
    
    @IBInspectable var activityBorderColour: CGColorRef = UIColor.lightGrayColor().CGColor {
        didSet {
            layer.borderColor = activityBorderColour
        }
    }
    
    @IBInspectable var cornerRounding: CGFloat = 10 {
        didSet {
            layer.cornerRadius = cornerRounding
        }
    }

    
    override func prepareForInterfaceBuilder() {
        cardStyle()
    }
    
    override func awakeFromNib() {
        cardStyle()

    }
    
    func cardStyle() {
        backgroundColor = blockColour
        layer.cornerRadius = cornerRounding
        layer.borderWidth = activityCardBorderWidth
        layer.borderColor = activityBorderColour
    }
    
}

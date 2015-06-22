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
    
    @IBInspectable var borderWidth: CGFloat  = 1 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColour: UIColor? {
        didSet {
            layer.borderColor = borderColour?.CGColor
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
        layer.borderWidth = borderWidth
        layer.borderColor = borderColour?.CGColor
        layer.masksToBounds = true
        
    }
    
}

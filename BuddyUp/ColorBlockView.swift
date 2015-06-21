//
//  ColorBlockView.swift
//  IBDesignableTest
//
//  Created by Yung Dai on 2015-06-21.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

@IBDesignable class ColorBlockView: UIView  {
    

    
    @IBInspectable var blockColour: UIColor = UIColor.grayColor().colorWithAlphaComponent(1.0) {
        didSet {
            backgroundColor = blockColour
        }
    }
    
    @IBInspectable var cornerRounding: CGFloat = 10 {
        didSet {
            layer.cornerRadius = cornerRounding
        }
    }

    
    override func prepareForInterfaceBuilder() {
        backgroundColor = blockColour
        layer.cornerRadius = cornerRounding
    }
    
    override func awakeFromNib() {
        backgroundColor = blockColour
        layer.cornerRadius = cornerRounding
    }
    
}

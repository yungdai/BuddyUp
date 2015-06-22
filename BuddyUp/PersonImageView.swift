//
//  PersonImageView.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-06-21.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

@IBDesignable class PersonImageView: UIImageView {

    @IBInspectable var cornerRounding: CGFloat = 50 {
        didSet {
            layer.cornerRadius = cornerRounding
            
        }
    }
    
    @IBInspectable var personBorderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = personBorderWidth

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
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

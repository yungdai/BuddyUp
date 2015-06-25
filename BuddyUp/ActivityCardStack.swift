//
//  ActivityCardStack.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-06-24.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

class ActivityCardStack: UIView {
    
    var cardOne:UIView?
    var cardTwo:UIView?
    var cardThree:UIView?
    var contentView:UIView?
    
    let initialRotationAngle = CGFloat(M_PI/180)
    
    override func awakeFromNib() {
        createMySubViews()
        AddMySubviews()
        
    }
    
    func createMySubViews () {
        cardOne = UIView(frame: bounds)
        cardTwo = UIView(frame: bounds)
        cardThree = UIView(frame: bounds)
        contentView = UIView(frame: bounds)
    }

    func AddMySubviews () {
        if let cOne = cardOne, cTwo = cardTwo, cThree = cardThree, content = contentView {
            
            cOne.transform = CGAffineTransformMakeRotation(initialRotationAngle)
            addSubview(cOne)
            
            cTwo.transform = CGAffineTransformMakeRotation(-initialRotationAngle)
            addSubview(cTwo)
            
            cThree.transform = CGAffineTransformMakeRotation(2*initialRotationAngle)
            addSubview(cThree)
            
           //styleMyView(content)
            addSubview(content)
            
        }
    }

}

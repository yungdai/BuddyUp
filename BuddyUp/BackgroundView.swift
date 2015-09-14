//
//  BackgroundView.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-06-25.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

@IBDesignable class BackgroundView: UIView {

    // MARK: Inspectable properties ******************************
    
    @IBInspectable var viewColour: UIColor = UIColor.grayColor() 
    
    @IBInspectable var gradientStartColor: UIColor = UIColor.whiteColor()
    
    @IBInspectable var gradientEndColor: UIColor = UIColor.blackColor()
    
    @IBInspectable var isHorizontal: Bool = false {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var roundness: CGFloat = 0.0
    
    // MARK: Internal functions *********************************
    
    // Setup the view appearance
    private func setupView(){
        
        let colors:Array = [gradientStartColor.CGColor, gradientEndColor.CGColor]
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = roundness
        
        if (isHorizontal){
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        }else{
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
        
        self.setNeedsDisplay()
        
    }
    
    // Helper to return the main layer as CAGradientLayer
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    // MARK: Overrides ******************************************
    
    override class func layerClass()->AnyClass{
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    
    func viewStyle() {
    backgroundColor = viewColour
        
    }



}

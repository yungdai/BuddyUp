//
//  ColorBlockView.swift
//  IBDesignableTest
//
//  Created by Yung Dai on 2015-06-21.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

@IBDesignable class ActivityCardView: UIView  {
    
    
    // MARK: Inspectable properties ******************************
    
    @IBInspectable var viewColour: UIColor = UIColor.grayColor() {
        didSet {
            backgroundColor = viewColour
        }
    }
    
    @IBInspectable var useGradient: Bool = false {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var StartColor: UIColor = UIColor.whiteColor()
    
    @IBInspectable var EndColor: UIColor = UIColor.blackColor()
    
    
    
    @IBInspectable var isHorizontal: Bool = false {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var roundness: CGFloat = 0.0 {
        didSet{
            setupView()
        }
    }
    
    // MARK: Internal functions *********************************
    
    // Setup the view appearance
    private func setupView(){
        
        if (useGradient) {
            let colors:Array = [StartColor.CGColor, EndColor.CGColor]
            gradientLayer.colors = colors
            gradientLayer.cornerRadius = roundness
        }
        
        
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
        super.init(coder: aDecoder)!
        setupView()
    }
    
    
    func viewStyle() {
        backgroundColor = viewColour
        
    }
}
    
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
    
    // MARK: Inspectable properties ******************************
    
    @IBInspectable var gradientStartColor: UIColor = UIColor.whiteColor() {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var gradientEndColor: UIColor = UIColor.blackColor() {
        didSet{
            setupView()
        }
    }
    
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
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
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

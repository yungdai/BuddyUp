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
    
    
    override init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        viewStyle()
    }
    
    override func awakeFromNib() {
        viewStyle()
        
        
    }
    
    
    func viewStyle() {
        backgroundColor = blockColour
        layer.cornerRadius = cornerRounding
        layer.borderWidth = borderWidth
        layer.borderColor = borderColour?.CGColor
        layer.masksToBounds = true
        
    }

    
//    override func prepareForInterfaceBuilder() {
//        createMySubViews()
//        styleAndAddMySubviews()
//    }
//    
//    override func awakeFromNib() {
//        createMySubViews()
//        styleAndAddMySubviews()
//    }
//    
//    // adding card values
//    var cardOne:UIView?
//    var cardTwo:UIView?
//    var cardThree:UIView?
//    var contentView:UIView?
//    
//    let initialRotationAngle = CGFloat(M_PI/180)
//    
//    func createMySubViews() {
//        cardOne = UIView(frame: CGRectMake(0, 0, self.layer.bounds.width, self.layer.bounds.height)) //self.frame.width//, self.frame.height))
//        cardTwo = UIView(frame: CGRectMake(0, 0, self.frame.width, self.frame.height))
//        cardThree = UIView(frame: CGRectMake(0, 0, self.frame.width, self.frame.height))
//        contentView = UIView(frame: CGRectMake(0, 0, self.bounds.width, self.bounds.height))
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        cardOne?.frame = CGRectMake(0, 0, self.bounds.width, self.bounds.height)//self.frame.width//, self.frame.height))
//        cardTwo?.frame = CGRectMake(0, 0, self.bounds.width, self.bounds.height)
//        cardThree?.frame = CGRectMake(0, 0, self.bounds.width, self.bounds.height)
//        contentView?.frame = CGRectMake(0, 0, self.bounds.width, self.bounds.height)
//    }
//    func styleAndAddMySubviews() {
//        if let cOne = cardOne, cTwo = cardTwo, cThree = cardThree, content = contentView {
//            viewStyle(cOne)
//            cOne.transform = CGAffineTransformMakeRotation(initialRotationAngle)
//            addSubview(cOne)
//            
//            viewStyle(cTwo)
//            cTwo.transform = CGAffineTransformMakeRotation(-initialRotationAngle)
//            addSubview(cTwo)
//            
//            viewStyle(cThree)
//            cThree.transform = CGAffineTransformMakeRotation(2*initialRotationAngle)
//            addSubview(cThree)
//            
//            //styleMyView(content)
//            viewStyle(content)
//            addSubview(content)
//            
//        }
//    }
//    
//    
//    func viewStyle(view: UIView) -> UIView{
//        view.backgroundColor = blockColour
//        view.layer.cornerRadius = cornerRounding
//        view.layer.borderWidth = borderWidth
//        view.layer.borderColor = borderColour?.CGColor
//        view.layer.masksToBounds = true
//        view.layer.bounds = self.bounds
//
//        return view
//        
//    }
    
}

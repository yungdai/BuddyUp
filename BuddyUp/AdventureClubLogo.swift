//
//  AdventureClubLogo.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-10-15.
//  Copyright © 2015 Yung Dai. All rights reserved.
//

import UIKit

@IBDesignable class AdventureClubLogo: UIView {
    
    
    //     Only override drawRect: if you perform custom drawing.
    //     An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        drawCanvas1()
        
    }
    
    func drawCanvas1(frame frame: CGRect = CGRectMake(0, 0, 311, 275)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        //// Color Declarations
        let gradientColor = UIColor(red: 1.000, green: 0.880, blue: 0.400, alpha: 1.000)
        let gradientColor2 = UIColor(red: 0.840, green: 0.720, blue: 0.120, alpha: 1.000)
        let strokeColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1.000)
        let gradientColor4 = UIColor(red: 0.680, green: 0.600, blue: 0.120, alpha: 1.000)
        let shadowTint = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        let fillColor = UIColor(red: 0.500, green: 0.500, blue: 0.500, alpha: 1.000)
        let strokeColor2 = UIColor(red: 0.546, green: 0.656, blue: 0.784, alpha: 1.000)
        let gradientColor5 = UIColor(red: 1.000, green: 0.880, blue: 0.000, alpha: 1.000)
        let textForeground2 = UIColor(red: 0.196, green: 0.184, blue: 0.984, alpha: 1.000)
        let fillColor2 = UIColor(red: 0.675, green: 0.651, blue: 0.133, alpha: 1.000)
        let fillColor3 = UIColor(red: 0.996, green: 0.957, blue: 0.212, alpha: 1.000)
        let fillColor4 = UIColor(red: 0.196, green: 0.184, blue: 0.984, alpha: 1.000)
        let fillColor5 = UIColor(red: 0.353, green: 0.992, blue: 0.498, alpha: 1.000)
        let fillColor6 = UIColor(red: 0.988, green: 0.051, blue: 0.149, alpha: 1.000)
        
        //// Gradient Declarations
        let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [gradientColor.CGColor, gradientColor2.CGColor], [0, 1])!
        let gradient3 = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [gradientColor5.CGColor, gradientColor4.CGColor], [0, 1])!
        
        //// Shadow Declarations
        let shadow2 = NSShadow()
        shadow2.shadowColor = shadowTint.colorWithAlphaComponent(0.5 * CGColorGetAlpha(shadowTint.CGColor))
        shadow2.shadowOffset = CGSizeMake(560.1, 2.1)
        shadow2.shadowBlurRadius = 12
        let shadow3 = NSShadow()
        shadow3.shadowColor = shadowTint.colorWithAlphaComponent(0.5 * CGColorGetAlpha(shadowTint.CGColor))
        shadow3.shadowOffset = CGSizeMake(622.1, 2.1)
        shadow3.shadowBlurRadius = 4
        
        //// Group 2
        //// Group 3
        CGContextSaveGState(context)
        CGContextBeginTransparencyLayer(context, nil)
        
        //// Clip Clip
        let clipPath = UIBezierPath(rect: CGRectMake(22.5, -0.28, 279, 275.45))
        clipPath.addClip()
        
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(-315.79, 44.86))
        bezierPath.addCurveToPoint(CGPointMake(-309.25, 90.85), controlPoint1: CGPointMake(-311.57, 59.13), controlPoint2: CGPointMake(-309.25, 74.64))
        bezierPath.addCurveToPoint(CGPointMake(-407, 218.45), controlPoint1: CGPointMake(-309.25, 161.32), controlPoint2: CGPointMake(-353.01, 218.45))
        bezierPath.addCurveToPoint(CGPointMake(-504.75, 90.85), controlPoint1: CGPointMake(-460.99, 218.45), controlPoint2: CGPointMake(-504.75, 161.32))
        bezierPath.addCurveToPoint(CGPointMake(-498.21, 44.86), controlPoint1: CGPointMake(-504.75, 74.64), controlPoint2: CGPointMake(-502.43, 59.13))
        bezierPath.addCurveToPoint(CGPointMake(-485.2, 45.21), controlPoint1: CGPointMake(-493.94, 45.09), controlPoint2: CGPointMake(-489.6, 45.21))
        bezierPath.addCurveToPoint(CGPointMake(-407, 30.47), controlPoint1: CGPointMake(-455.16, 45.21), controlPoint2: CGPointMake(-427.75, 39.64))
        bezierPath.addCurveToPoint(CGPointMake(-328.8, 45.21), controlPoint1: CGPointMake(-386.25, 39.64), controlPoint2: CGPointMake(-358.84, 45.21))
        bezierPath.addCurveToPoint(CGPointMake(-315.79, 44.86), controlPoint1: CGPointMake(-324.4, 45.21), controlPoint2: CGPointMake(-320.06, 45.09))
        bezierPath.closePath()
        bezierPath.usesEvenOddFillRule = true;
        
        CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, shadow2.shadowOffset, shadow2.shadowBlurRadius, (shadow2.shadowColor as! UIColor).CGColor)
        fillColor.setFill()
        bezierPath.fill()
        CGContextRestoreGState(context)
        
        
        
        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)
        
        
        //// Group 4
        CGContextSaveGState(context)
        CGContextBeginTransparencyLayer(context, nil)
        
        //// Clip Clip 2
        let clip2Path = UIBezierPath()
        clip2Path.moveToPoint(CGPointMake(241.97, 45.07))
        clip2Path.addCurveToPoint(CGPointMake(248.5, 90.94), controlPoint1: CGPointMake(246.19, 59.3), controlPoint2: CGPointMake(248.5, 74.77))
        clip2Path.addCurveToPoint(CGPointMake(151, 218.2), controlPoint1: CGPointMake(248.5, 161.22), controlPoint2: CGPointMake(204.85, 218.2))
        clip2Path.addCurveToPoint(CGPointMake(53.5, 90.94), controlPoint1: CGPointMake(97.15, 218.2), controlPoint2: CGPointMake(53.5, 161.22))
        clip2Path.addCurveToPoint(CGPointMake(60.03, 45.07), controlPoint1: CGPointMake(53.5, 74.77), controlPoint2: CGPointMake(55.81, 59.3))
        clip2Path.addCurveToPoint(CGPointMake(73, 45.42), controlPoint1: CGPointMake(64.29, 45.3), controlPoint2: CGPointMake(68.62, 45.42))
        clip2Path.addCurveToPoint(CGPointMake(151, 30.72), controlPoint1: CGPointMake(102.97, 45.42), controlPoint2: CGPointMake(130.3, 39.86))
        clip2Path.addCurveToPoint(CGPointMake(229, 45.42), controlPoint1: CGPointMake(171.7, 39.86), controlPoint2: CGPointMake(199.03, 45.42))
        clip2Path.addCurveToPoint(CGPointMake(241.97, 45.07), controlPoint1: CGPointMake(233.38, 45.42), controlPoint2: CGPointMake(237.71, 45.3))
        clip2Path.closePath()
        clip2Path.usesEvenOddFillRule = true;
        
        clip2Path.addClip()
        
        
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.moveToPoint(CGPointMake(241.97, 45.07))
        bezier2Path.addCurveToPoint(CGPointMake(248.5, 90.94), controlPoint1: CGPointMake(246.19, 59.3), controlPoint2: CGPointMake(248.5, 74.77))
        bezier2Path.addCurveToPoint(CGPointMake(151, 218.2), controlPoint1: CGPointMake(248.5, 161.22), controlPoint2: CGPointMake(204.85, 218.2))
        bezier2Path.addCurveToPoint(CGPointMake(53.5, 90.94), controlPoint1: CGPointMake(97.15, 218.2), controlPoint2: CGPointMake(53.5, 161.22))
        bezier2Path.addCurveToPoint(CGPointMake(60.03, 45.07), controlPoint1: CGPointMake(53.5, 74.77), controlPoint2: CGPointMake(55.81, 59.3))
        bezier2Path.addCurveToPoint(CGPointMake(73, 45.42), controlPoint1: CGPointMake(64.29, 45.3), controlPoint2: CGPointMake(68.62, 45.42))
        bezier2Path.addCurveToPoint(CGPointMake(151, 30.72), controlPoint1: CGPointMake(102.97, 45.42), controlPoint2: CGPointMake(130.3, 39.86))
        bezier2Path.addCurveToPoint(CGPointMake(229, 45.42), controlPoint1: CGPointMake(171.7, 39.86), controlPoint2: CGPointMake(199.03, 45.42))
        bezier2Path.addCurveToPoint(CGPointMake(241.97, 45.07), controlPoint1: CGPointMake(233.38, 45.42), controlPoint2: CGPointMake(237.71, 45.3))
        bezier2Path.closePath()
        bezier2Path.usesEvenOddFillRule = true;
        
        CGContextSaveGState(context)
        bezier2Path.addClip()
        CGContextDrawRadialGradient(context, gradient,
            CGPointMake(151, 110.5), 0,
            CGPointMake(151, 110.5), 107.7,
            [CGGradientDrawingOptions.DrawsBeforeStartLocation, CGGradientDrawingOptions.DrawsAfterEndLocation])
        CGContextRestoreGState(context)
        
        
        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)
        
        
        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.moveToPoint(CGPointMake(241.97, 45.07))
        bezier4Path.addCurveToPoint(CGPointMake(248.5, 90.94), controlPoint1: CGPointMake(246.19, 59.3), controlPoint2: CGPointMake(248.5, 74.77))
        bezier4Path.addCurveToPoint(CGPointMake(151, 218.2), controlPoint1: CGPointMake(248.5, 161.22), controlPoint2: CGPointMake(204.85, 218.2))
        bezier4Path.addCurveToPoint(CGPointMake(53.5, 90.94), controlPoint1: CGPointMake(97.15, 218.2), controlPoint2: CGPointMake(53.5, 161.22))
        bezier4Path.addCurveToPoint(CGPointMake(60.03, 45.07), controlPoint1: CGPointMake(53.5, 74.77), controlPoint2: CGPointMake(55.81, 59.3))
        bezier4Path.addCurveToPoint(CGPointMake(73, 45.42), controlPoint1: CGPointMake(64.29, 45.3), controlPoint2: CGPointMake(68.62, 45.42))
        bezier4Path.addCurveToPoint(CGPointMake(151, 30.72), controlPoint1: CGPointMake(102.97, 45.42), controlPoint2: CGPointMake(130.3, 39.86))
        bezier4Path.addCurveToPoint(CGPointMake(229, 45.42), controlPoint1: CGPointMake(171.7, 39.86), controlPoint2: CGPointMake(199.03, 45.42))
        bezier4Path.addCurveToPoint(CGPointMake(241.97, 45.07), controlPoint1: CGPointMake(233.38, 45.42), controlPoint2: CGPointMake(237.71, 45.3))
        bezier4Path.closePath()
        strokeColor2.setStroke()
        bezier4Path.lineWidth = 1
        bezier4Path.stroke()
        
        
        //// Group 5
        CGContextSaveGState(context)
        CGContextBeginTransparencyLayer(context, nil)
        
        //// Clip Clip 3
        let clip3Path = UIBezierPath()
        clip3Path.moveToPoint(CGPointMake(238.01, 47.74))
        clip3Path.addCurveToPoint(CGPointMake(244.26, 91.68), controlPoint1: CGPointMake(242.05, 61.37), controlPoint2: CGPointMake(244.26, 76.18))
        clip3Path.addCurveToPoint(CGPointMake(150.88, 213.55), controlPoint1: CGPointMake(244.26, 158.99), controlPoint2: CGPointMake(202.45, 213.55))
        clip3Path.addCurveToPoint(CGPointMake(57.5, 91.68), controlPoint1: CGPointMake(99.31, 213.55), controlPoint2: CGPointMake(57.5, 158.99))
        clip3Path.addCurveToPoint(CGPointMake(63.75, 47.74), controlPoint1: CGPointMake(57.5, 76.18), controlPoint2: CGPointMake(59.71, 61.37))
        clip3Path.addCurveToPoint(CGPointMake(76.18, 48.07), controlPoint1: CGPointMake(67.83, 47.96), controlPoint2: CGPointMake(71.98, 48.07))
        clip3Path.addCurveToPoint(CGPointMake(150.88, 34), controlPoint1: CGPointMake(104.88, 48.07), controlPoint2: CGPointMake(131.06, 42.75))
        clip3Path.addCurveToPoint(CGPointMake(225.59, 48.07), controlPoint1: CGPointMake(170.71, 42.75), controlPoint2: CGPointMake(196.89, 48.07))
        clip3Path.addCurveToPoint(CGPointMake(238.01, 47.74), controlPoint1: CGPointMake(229.79, 48.07), controlPoint2: CGPointMake(233.93, 47.96))
        clip3Path.closePath()
        clip3Path.usesEvenOddFillRule = true;
        
        clip3Path.addClip()
        
        
        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        bezier5Path.moveToPoint(CGPointMake(238.01, 47.74))
        bezier5Path.addCurveToPoint(CGPointMake(244.26, 91.68), controlPoint1: CGPointMake(242.05, 61.37), controlPoint2: CGPointMake(244.26, 76.18))
        bezier5Path.addCurveToPoint(CGPointMake(150.88, 213.55), controlPoint1: CGPointMake(244.26, 158.99), controlPoint2: CGPointMake(202.45, 213.55))
        bezier5Path.addCurveToPoint(CGPointMake(57.5, 91.68), controlPoint1: CGPointMake(99.31, 213.55), controlPoint2: CGPointMake(57.5, 158.99))
        bezier5Path.addCurveToPoint(CGPointMake(63.75, 47.74), controlPoint1: CGPointMake(57.5, 76.18), controlPoint2: CGPointMake(59.71, 61.37))
        bezier5Path.addCurveToPoint(CGPointMake(76.18, 48.07), controlPoint1: CGPointMake(67.83, 47.96), controlPoint2: CGPointMake(71.98, 48.07))
        bezier5Path.addCurveToPoint(CGPointMake(150.88, 34), controlPoint1: CGPointMake(104.88, 48.07), controlPoint2: CGPointMake(131.06, 42.75))
        bezier5Path.addCurveToPoint(CGPointMake(225.59, 48.07), controlPoint1: CGPointMake(170.71, 42.75), controlPoint2: CGPointMake(196.89, 48.07))
        bezier5Path.addCurveToPoint(CGPointMake(238.01, 47.74), controlPoint1: CGPointMake(229.79, 48.07), controlPoint2: CGPointMake(233.93, 47.96))
        bezier5Path.closePath()
        bezier5Path.usesEvenOddFillRule = true;
        
        CGContextSaveGState(context)
        bezier5Path.addClip()
        CGContextDrawLinearGradient(context, gradient3,
            CGPointMake(150.88, 34),
            CGPointMake(150.88, 213.55),
            [CGGradientDrawingOptions.DrawsBeforeStartLocation, CGGradientDrawingOptions.DrawsAfterEndLocation])
        CGContextRestoreGState(context)
        
        
        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)
        
        
        //// Bezier 7 Drawing
        let bezier7Path = UIBezierPath()
        bezier7Path.moveToPoint(CGPointMake(238.01, 47.74))
        bezier7Path.addCurveToPoint(CGPointMake(244.26, 91.68), controlPoint1: CGPointMake(242.05, 61.37), controlPoint2: CGPointMake(244.26, 76.18))
        bezier7Path.addCurveToPoint(CGPointMake(150.88, 213.55), controlPoint1: CGPointMake(244.26, 158.99), controlPoint2: CGPointMake(202.45, 213.55))
        bezier7Path.addCurveToPoint(CGPointMake(57.5, 91.68), controlPoint1: CGPointMake(99.31, 213.55), controlPoint2: CGPointMake(57.5, 158.99))
        bezier7Path.addCurveToPoint(CGPointMake(63.75, 47.74), controlPoint1: CGPointMake(57.5, 76.18), controlPoint2: CGPointMake(59.71, 61.37))
        bezier7Path.addCurveToPoint(CGPointMake(76.18, 48.07), controlPoint1: CGPointMake(67.83, 47.96), controlPoint2: CGPointMake(71.98, 48.07))
        bezier7Path.addCurveToPoint(CGPointMake(150.88, 34), controlPoint1: CGPointMake(104.88, 48.07), controlPoint2: CGPointMake(131.06, 42.75))
        bezier7Path.addCurveToPoint(CGPointMake(225.59, 48.07), controlPoint1: CGPointMake(170.71, 42.75), controlPoint2: CGPointMake(196.89, 48.07))
        bezier7Path.addCurveToPoint(CGPointMake(238.01, 47.74), controlPoint1: CGPointMake(229.79, 48.07), controlPoint2: CGPointMake(233.93, 47.96))
        bezier7Path.closePath()
        strokeColor.setStroke()
        bezier7Path.lineWidth = 1
        bezier7Path.stroke()
        
        
        //// Group 6
        CGContextSaveGState(context)
        CGContextBeginTransparencyLayer(context, nil)
        
        //// Clip Clip 4
        let clip4Path = UIBezierPath(rect: CGRectMake(0, 70, 311, 89))
        clip4Path.addClip()
        
        
        //// Label Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, -607, 135)
        
        let labelRect = CGRectMake(-626, -66, 1524.02, 72)
        let labelTextContent = NSString(string: "Adventure Club")
        CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, shadow3.shadowOffset, shadow3.shadowBlurRadius, (shadow3.shadowColor as! UIColor).CGColor)
        let labelStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        labelStyle.alignment = .Center
        
        let labelFontAttributes = [NSFontAttributeName: UIFont(name: "AvenirNext-BoldItalic", size: 36)!, NSForegroundColorAttributeName: textForeground2, NSParagraphStyleAttributeName: labelStyle]
        
        let labelTextHeight: CGFloat = labelTextContent.boundingRectWithSize(CGSizeMake(labelRect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: labelFontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, labelRect);
        labelTextContent.drawInRect(CGRectMake(labelRect.minX, labelRect.minY + (labelRect.height - labelTextHeight) / 2, labelRect.width, labelTextHeight), withAttributes: labelFontAttributes)
        CGContextRestoreGState(context)
        CGContextRestoreGState(context)
        
        
        CGContextRestoreGState(context)
        
        
        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)
        
        
        //// Group 7
        CGContextSaveGState(context)
        CGContextBeginTransparencyLayer(context, nil)
        
        //// Clip Clip 5
        let clip5Path = UIBezierPath(rect: CGRectMake(0, 70, 311, 89))
        clip5Path.addClip()
        
        
        //// Label 2 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, -607, 135)
        
        let label2Rect = CGRectMake(-626, -66, 1524.02, 72)
        let label2TextContent = NSString(string: "Adventure Club")
        CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, shadow3.shadowOffset, shadow3.shadowBlurRadius, (shadow3.shadowColor as! UIColor).CGColor)
        let label2Style = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        label2Style.alignment = .Center
        
        let label2FontAttributes = [NSFontAttributeName: UIFont(name: "AvenirNext-BoldItalic", size: 36)!, NSForegroundColorAttributeName: textForeground2, NSParagraphStyleAttributeName: label2Style]
        
        let label2TextHeight: CGFloat = label2TextContent.boundingRectWithSize(CGSizeMake(label2Rect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: label2FontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, label2Rect);
        label2TextContent.drawInRect(CGRectMake(label2Rect.minX, label2Rect.minY + (label2Rect.height - label2TextHeight) / 2, label2Rect.width, label2TextHeight), withAttributes: label2FontAttributes)
        CGContextRestoreGState(context)
        CGContextRestoreGState(context)
        
        
        CGContextRestoreGState(context)
        
        
        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)
        
        
        //// Label 3 Drawing
        let label3Rect = CGRectMake(15, 75, 272.02, 60)
        let label3TextContent = NSString(string: "Adventure Club")
        let label3Style = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        label3Style.alignment = .Center
        
        let label3FontAttributes = [NSFontAttributeName: UIFont(name: "AvenirNext-BoldItalic", size: 36)!, NSForegroundColorAttributeName: textForeground2, NSParagraphStyleAttributeName: label3Style]
        
        let label3TextHeight: CGFloat = label3TextContent.boundingRectWithSize(CGSizeMake(label3Rect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: label3FontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, label3Rect);
        label3TextContent.drawInRect(CGRectMake(label3Rect.minX, label3Rect.minY + (label3Rect.height - label3TextHeight) / 2, label3Rect.width, label3TextHeight), withAttributes: label3FontAttributes)
        CGContextRestoreGState(context)
        
        
        //// Label 4 Drawing
        let label4Rect = CGRectMake(15, 75, 272.02, 60)
        let label4TextContent = NSString(string: "Adventure Club")
        let label4Style = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        label4Style.alignment = .Center
        
        let label4FontAttributes = [NSFontAttributeName: UIFont(name: "AvenirNext-BoldItalic", size: 36)!, NSForegroundColorAttributeName: textForeground2, NSParagraphStyleAttributeName: label4Style]
        
        let label4TextHeight: CGFloat = label4TextContent.boundingRectWithSize(CGSizeMake(label4Rect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: label4FontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, label4Rect);
        label4TextContent.drawInRect(CGRectMake(label4Rect.minX, label4Rect.minY + (label4Rect.height - label4TextHeight) / 2, label4Rect.width, label4TextHeight), withAttributes: label4FontAttributes)
        CGContextRestoreGState(context)
        
        
        //// Bezier 8 Drawing
        let bezier8Path = UIBezierPath()
        bezier8Path.moveToPoint(CGPointMake(218.5, 80.75))
        bezier8Path.addLineToPoint(CGPointMake(208.8, 85.23))
        bezier8Path.addLineToPoint(CGPointMake(210.65, 75.74))
        bezier8Path.addLineToPoint(CGPointMake(202.81, 69.02))
        bezier8Path.addLineToPoint(CGPointMake(213.65, 67.63))
        bezier8Path.addLineToPoint(CGPointMake(218.5, 59))
        bezier8Path.addLineToPoint(CGPointMake(223.35, 67.63))
        bezier8Path.addLineToPoint(CGPointMake(234.19, 69.02))
        bezier8Path.addLineToPoint(CGPointMake(226.35, 75.74))
        bezier8Path.addLineToPoint(CGPointMake(228.2, 85.23))
        bezier8Path.addLineToPoint(CGPointMake(218.5, 80.75))
        bezier8Path.closePath()
        bezier8Path.usesEvenOddFillRule = true;
        
        fillColor2.setFill()
        bezier8Path.fill()
        
        
        //// Bezier 9 Drawing
        let bezier9Path = UIBezierPath()
        bezier9Path.moveToPoint(CGPointMake(218, 79))
        bezier9Path.addLineToPoint(CGPointMake(209.77, 82.71))
        bezier9Path.addLineToPoint(CGPointMake(211.34, 74.85))
        bezier9Path.addLineToPoint(CGPointMake(204.69, 69.29))
        bezier9Path.addLineToPoint(CGPointMake(213.89, 68.15))
        bezier9Path.addLineToPoint(CGPointMake(218, 61))
        bezier9Path.addLineToPoint(CGPointMake(222.11, 68.15))
        bezier9Path.addLineToPoint(CGPointMake(231.31, 69.29))
        bezier9Path.addLineToPoint(CGPointMake(224.66, 74.85))
        bezier9Path.addLineToPoint(CGPointMake(226.23, 82.71))
        bezier9Path.addLineToPoint(CGPointMake(218, 79))
        bezier9Path.closePath()
        bezier9Path.usesEvenOddFillRule = true;
        
        fillColor3.setFill()
        bezier9Path.fill()
        
        
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalInRect: CGRectMake(71, 59, 7, 7))
        fillColor4.setFill()
        ovalPath.fill()
        
        
        //// Oval 2 Drawing
        let oval2Path = UIBezierPath(ovalInRect: CGRectMake(71, 59, 7, 7))
        strokeColor.setStroke()
        oval2Path.lineWidth = 1
        oval2Path.stroke()
        
        
        //// Oval 3 Drawing
        let oval3Path = UIBezierPath(ovalInRect: CGRectMake(75, 67, 7, 7))
        fillColor5.setFill()
        oval3Path.fill()
        
        
        //// Oval 4 Drawing
        let oval4Path = UIBezierPath(ovalInRect: CGRectMake(75, 67, 7, 7))
        strokeColor.setStroke()
        oval4Path.lineWidth = 1
        oval4Path.stroke()
        
        
        //// Oval 5 Drawing
        let oval5Path = UIBezierPath(ovalInRect: CGRectMake(66, 67, 7, 7))
        fillColor6.setFill()
        oval5Path.fill()
        
        
        //// Oval 6 Drawing
        let oval6Path = UIBezierPath(ovalInRect: CGRectMake(66, 67, 7, 7))
        strokeColor.setStroke()
        oval6Path.lineWidth = 1
        oval6Path.stroke()
    }

}
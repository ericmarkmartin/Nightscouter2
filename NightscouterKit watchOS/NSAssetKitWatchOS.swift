//
//  NSAssetKitWatchOS.swift
//  Nightscouter
//
//  Created by Peter Ina on 1/18/16.
//  Copyright (c) 2016 Nothingonline.net. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

public class NSAssetKitWatchOS : NSObject {

    //// Cache

    private struct Cache {
        static let appLogoTintColor: UIColor = UIColor(red: 0.000, green: 0.451, blue: 0.812, alpha: 1.000)
        static let darkNavColor: UIColor = NSAssetKitWatchOS.appLogoTintColor.colorWithShadow(0.6)
        static let predefinedWarningColor: UIColor = UIColor(red: 1.000, green: 0.902, blue: 0.125, alpha: 1.000)
        static let predefinedPostiveColor: UIColor = UIColor(red: 0.016, green: 0.871, blue: 0.443, alpha: 1.000)
        static let predefinedAlertColor: UIColor = UIColor(red: 1.000, green: 0.067, blue: 0.310, alpha: 1.000)
        static let predefinedNeutralColor: UIColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1.000)
        static let predefinedLogoColor: UIColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1.000)
    }

    //// Colors

    public class var appLogoTintColor: UIColor { return Cache.appLogoTintColor }
    public class var darkNavColor: UIColor { return Cache.darkNavColor }
    public class var predefinedWarningColor: UIColor { return Cache.predefinedWarningColor }
    public class var predefinedPostiveColor: UIColor { return Cache.predefinedPostiveColor }
    public class var predefinedAlertColor: UIColor { return Cache.predefinedAlertColor }
    public class var predefinedNeutralColor: UIColor { return Cache.predefinedNeutralColor }
    public class var predefinedLogoColor: UIColor { return Cache.predefinedLogoColor }

    //// Drawing Methods

    public class func drawWatchFace(watchFrame watchFrame: CGRect = CGRectMake(0, 0, 134, 134), arrowTintColor: UIColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1.000), rawColor: UIColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1.000), isDoubleUp: Bool = false, isArrowVisible: Bool = false, isRawEnabled: Bool = true, textSizeForSgv: CGFloat = 39, textSizeForDelta: CGFloat = 10, textSizeForRaw: CGFloat = 12, deltaString: String = "-- --/--", sgvString: String = "---", rawString: String = "--- : -----", angle: CGFloat = 0) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Color Declarations
        let arrowTintShadowColor = arrowTintColor.colorWithShadow(0.2)

        //// Variable Declarations
        let arrowNotVisible = !isArrowVisible
        let isUncomputable = arrowNotVisible


        //// Subframes
        let group: CGRect = CGRectMake(watchFrame.minX + floor((watchFrame.width - 98) * 0.50000 + 0.5), watchFrame.minY + floor((watchFrame.height - 98) * 0.63889 + 0.5), 98, 98)
        let frame4 = CGRectMake(group.minX, group.minY, 98, 98)
        let centerRing: CGRect = CGRectMake(watchFrame.minX + floor((watchFrame.width - 117) * 0.52941 + 0.5), watchFrame.minY + floor((watchFrame.height - 117) * 0.47059 + 0.5), 117, 117)
        let frame3 = CGRectMake(centerRing.minX, centerRing.minY, 117, 117)
        let innerRing: CGRect = CGRectMake(watchFrame.minX + floor((watchFrame.width - 119) * 0.46667 + 0.5), watchFrame.minY + floor((watchFrame.height - 119) * 0.46667 + 0.5), 119, 119)
        let frame = CGRectMake(innerRing.minX, innerRing.minY, 119, 119)
        let frame2 = CGRectMake(watchFrame.minX, watchFrame.minY, 134, 134)
        let group2: CGRect = CGRectMake(frame2.minX + floor((frame2.width - 121.01) * 0.49961 + 0.01) + 0.49, frame2.minY + floor((frame2.height - 97.25) * 0.00004 - 0.25) + 0.75, 121.01, 97.25)


        //// Group
        //// sgvLabel Drawing
        let sgvLabelRect = CGRectMake(frame4.minX + floor(frame4.width * 0.04082 + 0.5), frame4.minY + floor(frame4.height * 0.03061 + 0.5), floor(frame4.width * 0.95918 + 0.5) - floor(frame4.width * 0.04082 + 0.5), floor(frame4.height * 0.58163 + 0.5) - floor(frame4.height * 0.03061 + 0.5))
        let sgvLabelStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        sgvLabelStyle.alignment = .Center

        let sgvLabelFontAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: textSizeForSgv)!, NSForegroundColorAttributeName: arrowTintShadowColor, NSParagraphStyleAttributeName: sgvLabelStyle]

        NSString(string: sgvString).drawInRect(sgvLabelRect, withAttributes: sgvLabelFontAttributes)


        //// deltaLabel Drawing
        let deltaLabelRect = CGRectMake(frame4.minX + floor(frame4.width * 0.04082 + 0.5), frame4.minY + floor(frame4.height * 0.48980 + 0.5), floor(frame4.width * 0.95918 + 0.5) - floor(frame4.width * 0.04082 + 0.5), floor(frame4.height * 0.66327 + 0.5) - floor(frame4.height * 0.48980 + 0.5))
        let deltaLabelStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        deltaLabelStyle.alignment = .Center

        let deltaLabelFontAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(textSizeForDelta), NSForegroundColorAttributeName: arrowTintShadowColor, NSParagraphStyleAttributeName: deltaLabelStyle]

        let deltaLabelTextHeight: CGFloat = NSString(string: deltaString).boundingRectWithSize(CGSizeMake(deltaLabelRect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: deltaLabelFontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, deltaLabelRect);
        NSString(string: deltaString).drawInRect(CGRectMake(deltaLabelRect.minX, deltaLabelRect.minY + (deltaLabelRect.height - deltaLabelTextHeight) / 2, deltaLabelRect.width, deltaLabelTextHeight), withAttributes: deltaLabelFontAttributes)
        CGContextRestoreGState(context)


        if (isRawEnabled) {
            //// rawLabel Drawing
            let rawLabelRect = CGRectMake(frame4.minX + floor(frame4.width * 0.04082 + 0.5), frame4.minY + floor(frame4.height * 0.65306 + 0.5), floor(frame4.width * 0.95918 + 0.5) - floor(frame4.width * 0.04082 + 0.5), floor(frame4.height * 0.86735 + 0.5) - floor(frame4.height * 0.65306 + 0.5))
            let rawLabelStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
            rawLabelStyle.alignment = .Center

            let rawLabelFontAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(textSizeForRaw), NSForegroundColorAttributeName: rawColor, NSParagraphStyleAttributeName: rawLabelStyle]

            let rawLabelTextHeight: CGFloat = NSString(string: rawString).boundingRectWithSize(CGSizeMake(rawLabelRect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: rawLabelFontAttributes, context: nil).size.height
            CGContextSaveGState(context)
            CGContextClipToRect(context, rawLabelRect);
            NSString(string: rawString).drawInRect(CGRectMake(rawLabelRect.minX, rawLabelRect.minY + (rawLabelRect.height - rawLabelTextHeight) / 2, rawLabelRect.width, rawLabelTextHeight), withAttributes: rawLabelFontAttributes)
            CGContextRestoreGState(context)
        }




        //// centerRing
        if (isUncomputable) {
            //// Oval 3 Drawing
            CGContextSaveGState(context)
            CGContextTranslateCTM(context, frame3.minX + 0.49573 * frame3.width, frame3.minY + 0.50427 * frame3.height)

            let oval3Path = UIBezierPath(ovalInRect: CGRectMake(-52.5, -52.5, 105, 105))
            arrowTintShadowColor.setStroke()
            oval3Path.lineWidth = 3
            oval3Path.stroke()

            CGContextRestoreGState(context)
        }




        if (isDoubleUp) {
            //// outterRing
            //// Group 2
            CGContextSaveGState(context)
            CGContextBeginTransparencyLayer(context, nil)

            //// Clip Bezier 2
            let bezier2Path = UIBezierPath()
            bezier2Path.moveToPoint(CGPointMake(0.5, -67))
            bezier2Path.addCurveToPoint(CGPointMake(7.06, -60.09), controlPoint1: CGPointMake(0.5, -67), controlPoint2: CGPointMake(4.27, -63.03))
            bezier2Path.addCurveToPoint(CGPointMake(52.39, -30.25), controlPoint1: CGPointMake(25.37, -57.92), controlPoint2: CGPointMake(42.47, -47.44))
            bezier2Path.addCurveToPoint(CGPointMake(52.39, 30.25), controlPoint1: CGPointMake(63.2, -11.53), controlPoint2: CGPointMake(63.2, 11.53))
            bezier2Path.addLineToPoint(CGPointMake(48.93, 28.25))
            bezier2Path.addCurveToPoint(CGPointMake(48.93, -28.25), controlPoint1: CGPointMake(59.02, 10.77), controlPoint2: CGPointMake(59.02, -10.77))
            bezier2Path.addCurveToPoint(CGPointMake(6.03, -56.18), controlPoint1: CGPointMake(39.56, -44.49), controlPoint2: CGPointMake(23.34, -54.31))
            bezier2Path.addCurveToPoint(CGPointMake(0.5, -62), controlPoint1: CGPointMake(3.42, -58.92), controlPoint2: CGPointMake(0.5, -62))
            bezier2Path.addCurveToPoint(CGPointMake(-4.92, -56.3), controlPoint1: CGPointMake(0.5, -62), controlPoint2: CGPointMake(-2.34, -59.01))
            bezier2Path.addCurveToPoint(CGPointMake(-28.25, -48.93), controlPoint1: CGPointMake(-12.9, -55.61), controlPoint2: CGPointMake(-20.85, -53.2))
            bezier2Path.addCurveToPoint(CGPointMake(-55.84, -8.63), controlPoint1: CGPointMake(-43.67, -40.03), controlPoint2: CGPointMake(-53.3, -24.96))
            bezier2Path.addCurveToPoint(CGPointMake(-53.75, 17.44), controlPoint1: CGPointMake(-57.17, -0.05), controlPoint2: CGPointMake(-56.54, 8.88))
            bezier2Path.addCurveToPoint(CGPointMake(-48.93, 28.25), controlPoint1: CGPointMake(-52.55, 21.13), controlPoint2: CGPointMake(-50.95, 24.75))
            bezier2Path.addLineToPoint(CGPointMake(-52.39, 30.25))
            bezier2Path.addCurveToPoint(CGPointMake(-56.81, -20.8), controlPoint1: CGPointMake(-61.72, 14.1), controlPoint2: CGPointMake(-62.75, -4.56))
            bezier2Path.addCurveToPoint(CGPointMake(-30.25, -52.39), controlPoint1: CGPointMake(-52.11, -33.66), controlPoint2: CGPointMake(-43.04, -45.01))
            bezier2Path.addCurveToPoint(CGPointMake(-5.94, -60.22), controlPoint1: CGPointMake(-22.54, -56.85), controlPoint2: CGPointMake(-14.26, -59.41))
            bezier2Path.addCurveToPoint(CGPointMake(0.5, -67), controlPoint1: CGPointMake(-3.21, -63.1), controlPoint2: CGPointMake(0.39, -66.88))
            bezier2Path.addLineToPoint(CGPointMake(0.5, -67))
            bezier2Path.closePath()
                        var bezier2Transformation = CGAffineTransformIdentity
            bezier2Transformation = CGAffineTransformTranslate(bezier2Transformation, group2.minX + 60.51, group2.minY + 67)

            bezier2Path.applyTransform(bezier2Transformation)
            bezier2Path.addClip()


            //// Rectangle Drawing
            CGContextSaveGState(context)
            CGContextTranslateCTM(context, group2.minX + 60.51, group2.minY + 67)
            CGContextRotateCTM(context, -angle * CGFloat(M_PI) / 180)

            let rectanglePath = UIBezierPath()
            rectanglePath.moveToPoint(CGPointMake(10, -57))
            rectanglePath.addLineToPoint(CGPointMake(0.5, -67))
            rectanglePath.addLineToPoint(CGPointMake(-9, -57))
            rectanglePath.addLineToPoint(CGPointMake(10, -57))
            rectanglePath.closePath()
            arrowTintShadowColor.setFill()
            rectanglePath.fill()

            CGContextRestoreGState(context)


            //// Oval 2 Drawing
            CGContextSaveGState(context)
            CGContextTranslateCTM(context, group2.minX + 60.51, group2.minY + 67)
            CGContextRotateCTM(context, -angle * CGFloat(M_PI) / 180)

            let oval2Rect = CGRectMake(-58.5, -58.5, 117, 117)
            let oval2Path = UIBezierPath()
            oval2Path.addArcWithCenter(CGPointMake(oval2Rect.midX, oval2Rect.midY), radius: oval2Rect.width / 2, startAngle: -210 * CGFloat(M_PI)/180, endAngle: 30 * CGFloat(M_PI)/180, clockwise: true)

            arrowTintShadowColor.setStroke()
            oval2Path.lineWidth = 4
            oval2Path.stroke()

            CGContextRestoreGState(context)


            CGContextEndTransparencyLayer(context)
            CGContextRestoreGState(context)


        }


        //// innerRing
        //// Oval Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, frame.minX + 0.50420 * frame.width, frame.minY + 0.50420 * frame.height)
        CGContextRotateCTM(context, -angle * CGFloat(M_PI) / 180)

        let ovalRect = CGRectMake(-52.5, -52.5, 105, 105)
        let ovalPath = UIBezierPath()
        ovalPath.addArcWithCenter(CGPointMake(ovalRect.midX, ovalRect.midY), radius: ovalRect.width / 2, startAngle: -220 * CGFloat(M_PI)/180, endAngle: 40 * CGFloat(M_PI)/180, clockwise: true)

        arrowTintShadowColor.setStroke()
        ovalPath.lineWidth = 3
        ovalPath.stroke()

        CGContextRestoreGState(context)


        if (isArrowVisible) {
            //// Rectangle 2 Drawing
            CGContextSaveGState(context)
            CGContextTranslateCTM(context, frame.minX + 0.50420 * frame.width, frame.minY + 0.50420 * frame.height)
            CGContextRotateCTM(context, -angle * CGFloat(M_PI) / 180)

            let rectangle2Path = UIBezierPath()
            rectangle2Path.moveToPoint(CGPointMake(8, -53))
            rectangle2Path.addLineToPoint(CGPointMake(0.5, -59))
            rectangle2Path.addLineToPoint(CGPointMake(-7, -53))
            rectangle2Path.addLineToPoint(CGPointMake(8, -53))
            rectangle2Path.closePath()
            arrowTintShadowColor.setFill()
            rectangle2Path.fill()

            CGContextRestoreGState(context)
        }
    }

    public class func drawSourceIcon(logoTintColor logoTintColor: UIColor = UIColor(red: 0.300, green: 0.300, blue: 0.300, alpha: 1.000)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Color Declarations
        let logoHighlightColor = logoTintColor.colorWithHighlight(1)
        let logoShadowColor = NSAssetKitWatchOS.appLogoTintColor.colorWithShadow(0.218)

        //// Gradient Declarations
        let logoGradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [NSAssetKitWatchOS.appLogoTintColor.CGColor, logoShadowColor.CGColor], [0, 1])!

        //// Group
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRectMake(0, 0, 100, 100))
        CGContextSaveGState(context)
        rectanglePath.addClip()
        CGContextDrawLinearGradient(context, logoGradient, CGPointMake(50, -0), CGPointMake(50, 100), CGGradientDrawingOptions())
        CGContextRestoreGState(context)


        //// outerShape 2 Drawing
        let outerShape2Path = UIBezierPath()
        outerShape2Path.moveToPoint(CGPointMake(79.86, 38.09))
        outerShape2Path.addCurveToPoint(CGPointMake(74.53, 58.24), controlPoint1: CGPointMake(80.6, 42.54), controlPoint2: CGPointMake(78.37, 50.18))
        outerShape2Path.addCurveToPoint(CGPointMake(54.82, 85.32), controlPoint1: CGPointMake(69.65, 68.49), controlPoint2: CGPointMake(62.16, 79.41))
        outerShape2Path.addCurveToPoint(CGPointMake(50.78, 88.33), controlPoint1: CGPointMake(51.54, 87.96), controlPoint2: CGPointMake(51.75, 87.84))
        outerShape2Path.addCurveToPoint(CGPointMake(49.26, 88.33), controlPoint1: CGPointMake(50.52, 88.33), controlPoint2: CGPointMake(49.52, 88.33))
        outerShape2Path.addCurveToPoint(CGPointMake(45.21, 85.32), controlPoint1: CGPointMake(49.26, 88.33), controlPoint2: CGPointMake(46.83, 86.81))
        outerShape2Path.addCurveToPoint(CGPointMake(24.37, 58.1), controlPoint1: CGPointMake(38.74, 79.38), controlPoint2: CGPointMake(28.69, 68.39))
        outerShape2Path.addCurveToPoint(CGPointMake(20.18, 38.09), controlPoint1: CGPointMake(21, 50.09), controlPoint2: CGPointMake(19.44, 42.51))
        outerShape2Path.addCurveToPoint(CGPointMake(49.13, 10), controlPoint1: CGPointMake(20.18, 22.58), controlPoint2: CGPointMake(33.14, 10))
        outerShape2Path.addCurveToPoint(CGPointMake(50.9, 10), controlPoint1: CGPointMake(49.44, 10), controlPoint2: CGPointMake(50.6, 10))
        outerShape2Path.addCurveToPoint(CGPointMake(79.86, 38.09), controlPoint1: CGPointMake(66.9, 10), controlPoint2: CGPointMake(79.86, 22.58))
        outerShape2Path.closePath()
        outerShape2Path.lineCapStyle = .Round;

        outerShape2Path.lineJoinStyle = .Round;

        logoHighlightColor.setStroke()
        outerShape2Path.lineWidth = 1.5
        outerShape2Path.stroke()


        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalInRect: CGRectMake(28, 19, 44, 39))
        logoHighlightColor.setStroke()
        ovalPath.lineWidth = 1.5
        ovalPath.stroke()


        //// crest
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(65, 60))
        bezierPath.addCurveToPoint(CGPointMake(53.02, 76.03), controlPoint1: CGPointMake(65, 60), controlPoint2: CGPointMake(61.48, 69.12))
        bezierPath.addCurveToPoint(CGPointMake(50.71, 77.84), controlPoint1: CGPointMake(51.31, 77.42), controlPoint2: CGPointMake(51.07, 77.64))
        bezierPath.addCurveToPoint(CGPointMake(50.57, 78), controlPoint1: CGPointMake(50.62, 77.95), controlPoint2: CGPointMake(50.57, 78))
        bezierPath.addLineToPoint(CGPointMake(49.43, 78))
        bezierPath.addCurveToPoint(CGPointMake(49.29, 77.84), controlPoint1: CGPointMake(49.43, 78), controlPoint2: CGPointMake(49.38, 77.95))
        bezierPath.addCurveToPoint(CGPointMake(46.98, 76.03), controlPoint1: CGPointMake(48.93, 77.64), controlPoint2: CGPointMake(48.69, 77.42))
        bezierPath.addCurveToPoint(CGPointMake(43.65, 72.97), controlPoint1: CGPointMake(45.77, 75.04), controlPoint2: CGPointMake(44.67, 74.01))
        bezierPath.addCurveToPoint(CGPointMake(48.98, 65.02), controlPoint1: CGPointMake(44.98, 70.98), controlPoint2: CGPointMake(47.66, 66.99))
        bezierPath.addCurveToPoint(CGPointMake(50, 65.05), controlPoint1: CGPointMake(49.32, 65.04), controlPoint2: CGPointMake(49.66, 65.05))
        bezierPath.addCurveToPoint(CGPointMake(65, 60), controlPoint1: CGPointMake(57.01, 65.05), controlPoint2: CGPointMake(65, 60))
        bezierPath.closePath()
        bezierPath.moveToPoint(CGPointMake(35, 60))
        bezierPath.addCurveToPoint(CGPointMake(44.56, 64.22), controlPoint1: CGPointMake(35, 60), controlPoint2: CGPointMake(39.41, 62.79))
        bezierPath.addCurveToPoint(CGPointMake(40.58, 69.42), controlPoint1: CGPointMake(43.86, 65.14), controlPoint2: CGPointMake(41.98, 67.6))
        bezierPath.addCurveToPoint(CGPointMake(35, 60), controlPoint1: CGPointMake(36.7, 64.41), controlPoint2: CGPointMake(35, 60))
        bezierPath.addLineToPoint(CGPointMake(35, 60))
        bezierPath.closePath()
        bezierPath.lineCapStyle = .Round;

        bezierPath.lineJoinStyle = .Round;

        logoHighlightColor.setFill()
        bezierPath.fill()




        //// Oval 5 Drawing
        let oval5Path = UIBezierPath(ovalInRect: CGRectMake(37, 34, 6, 6))
        logoHighlightColor.setFill()
        oval5Path.fill()


        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.moveToPoint(CGPointMake(50, 28.33))
        bezier3Path.addLineToPoint(CGPointMake(50, 46.67))
        bezier3Path.lineCapStyle = .Round;

        logoHighlightColor.setStroke()
        bezier3Path.lineWidth = 1.5
        bezier3Path.stroke()


        //// Oval 2 Drawing
        let oval2Path = UIBezierPath(ovalInRect: CGRectMake(57, 34, 6, 6))
        logoHighlightColor.setFill()
        oval2Path.fill()
    }

    public class func drawRefreshMenuIconSource(iconSstroke iconSstroke: CGFloat = 5) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Group
        //// Oval Drawing
        let ovalRect = CGRectMake(5, 8, 38, 38)
        let ovalPath = UIBezierPath()
        ovalPath.addArcWithCenter(CGPointMake(ovalRect.midX, ovalRect.midY), radius: ovalRect.width / 2, startAngle: 45 * CGFloat(M_PI)/180, endAngle: -2 * CGFloat(M_PI)/180, clockwise: true)

        UIColor.blackColor().setStroke()
        ovalPath.lineWidth = iconSstroke
        ovalPath.stroke()


        //// Bezier Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 42.5, 26)
        CGContextRotateCTM(context, 90 * CGFloat(M_PI) / 180)

        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(-3.5, 7))
        bezierPath.addLineToPoint(CGPointMake(3.5, 0))
        bezierPath.addLineToPoint(CGPointMake(-3.5, -7))
        bezierPath.lineCapStyle = .Round;

        UIColor.blackColor().setStroke()
        bezierPath.lineWidth = iconSstroke
        bezierPath.stroke()

        CGContextRestoreGState(context)
    }

    //// Generated Images

    public class func imageOfWatchFace(watchFrame watchFrame: CGRect = CGRectMake(0, 0, 134, 134), arrowTintColor: UIColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1.000), rawColor: UIColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1.000), isDoubleUp: Bool = false, isArrowVisible: Bool = false, isRawEnabled: Bool = true, textSizeForSgv: CGFloat = 39, textSizeForDelta: CGFloat = 10, textSizeForRaw: CGFloat = 12, deltaString: String = "-- --/--", sgvString: String = "---", rawString: String = "--- : -----", angle: CGFloat = 0) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(watchFrame.size, false, 0)
            NSAssetKitWatchOS.drawWatchFace(watchFrame: CGRectMake(0, 0, watchFrame.size.width, watchFrame.size.height), arrowTintColor: arrowTintColor, rawColor: rawColor, isDoubleUp: isDoubleUp, isArrowVisible: isArrowVisible, isRawEnabled: isRawEnabled, textSizeForSgv: textSizeForSgv, textSizeForDelta: textSizeForDelta, textSizeForRaw: textSizeForRaw, deltaString: deltaString, sgvString: sgvString, rawString: rawString, angle: angle)

        let imageOfWatchFace = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return imageOfWatchFace
    }

}



extension UIColor {
    func colorWithHue(newHue: CGFloat) -> UIColor {
        var saturation: CGFloat = 1.0, brightness: CGFloat = 1.0, alpha: CGFloat = 1.0
        self.getHue(nil, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return UIColor(hue: newHue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    func colorWithSaturation(newSaturation: CGFloat) -> UIColor {
        var hue: CGFloat = 1.0, brightness: CGFloat = 1.0, alpha: CGFloat = 1.0
        self.getHue(&hue, saturation: nil, brightness: &brightness, alpha: &alpha)
        return UIColor(hue: hue, saturation: newSaturation, brightness: brightness, alpha: alpha)
    }
    func colorWithBrightness(newBrightness: CGFloat) -> UIColor {
        var hue: CGFloat = 1.0, saturation: CGFloat = 1.0, alpha: CGFloat = 1.0
        self.getHue(&hue, saturation: &saturation, brightness: nil, alpha: &alpha)
        return UIColor(hue: hue, saturation: saturation, brightness: newBrightness, alpha: alpha)
    }
    func colorWithAlpha(newAlpha: CGFloat) -> UIColor {
        var hue: CGFloat = 1.0, saturation: CGFloat = 1.0, brightness: CGFloat = 1.0
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: nil)
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: newAlpha)
    }
    func colorWithHighlight(highlight: CGFloat) -> UIColor {
        var red: CGFloat = 1.0, green: CGFloat = 1.0, blue: CGFloat = 1.0, alpha: CGFloat = 1.0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return UIColor(red: red * (1-highlight) + highlight, green: green * (1-highlight) + highlight, blue: blue * (1-highlight) + highlight, alpha: alpha * (1-highlight) + highlight)
    }
    func colorWithShadow(shadow: CGFloat) -> UIColor {
        var red: CGFloat = 1.0, green: CGFloat = 1.0, blue: CGFloat = 1.0, alpha: CGFloat = 1.0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return UIColor(red: red * (1-shadow), green: green * (1-shadow), blue: blue * (1-shadow), alpha: alpha * (1-shadow) + shadow)
    }
}
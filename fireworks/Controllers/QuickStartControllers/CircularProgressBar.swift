//
//  CircularProgressBar.swift
//  CircularStepCounter
//
//  A simple circle progress bar class, based on UIKit,
//  bazier path, CAShapeLayer and CABasicAnimation.
//
//  Created by Simone Formisano on 22/11/2019.
//  Copyright © 2019 DesingerWannaBee. All rights reserved.
//

import UIKit

extension UIColor {
    /**
        Converts a color hex value to a UIColor objects

        - Parameters:
            - rgbValue: The RGB hex UInt such as: 0x13F75E
            - alpha: The opacity value of the color
    */
    func UIColorFromRGB(rgbValue: UInt, alpha: CGFloat) -> UIColor {
         return UIColor(
             red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
             green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
             blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
             alpha: CGFloat(alpha)
         )
     }
}

class CircularProgressBar {
    private var arcLayer: CAShapeLayer!
    private var viewContainer: UIView
    
    /**
        The constructor takes as parameter the UIView which will contain the progress bar
     */
    init(viewContainer: UIView) {
        self.viewContainer = viewContainer
    }
    
    /**
        Creates and show the progress bar in the viewContainer specified during the intialization

        - Parameters:
            - radius: The radius of the arc
            - center: The center of the arc
            - startAngle: The starting angle of the main progress bar arc
            - progressBarWidth: The width of the main progress bar
            - progressBarTrackWidth: The width of the background bar
            - progressBarColor: The main progress bar color
            - progressBarTrackColor: The background bar color
            - progressBarColorAlpha: The main progress bar color alpha
            - progressBarTrackColorAlpha: The background bar color alpha
    */
    func createAndShowCircularProgressBar(radius: CGFloat, center: CGPoint, startAngle: CGFloat, progressBarWidth: CGFloat, progressBarTrackWidth: CGFloat, progressBarColor: UInt, progressBarTrackColor: UInt, progressBarColorAlpha: CGFloat, progressBarTrackColorAlpha: CGFloat) {
        
        // --- Background track circle ---
        let ARC_LAYER_TRACK = createArc(center: center, radius: radius, strokeEnd: 1.0, color: progressBarTrackColor, colorAlpha: progressBarTrackColorAlpha, width: progressBarTrackWidth)
        
        // --- Progress arc ---
        arcLayer = createArc(center: center, radius: radius, strokeEnd: 0.0, color: progressBarColor, colorAlpha: progressBarColorAlpha, width: progressBarWidth)

        viewContainer.layer.addSublayer(ARC_LAYER_TRACK) // adding background arc
        viewContainer.layer.addSublayer(arcLayer) // adding main progress bar
    }
    
    /**
        Creates an arc based on bezier path, with the given propreties

        - Parameters:
            - center: The center of the arc
            - radius: The radius of the arc
            - strokeEnd: The stroke end value state between 0.0 and 1.0
            - colorAlpha: The color alpha
            - width: The width of the arc
     
        - Returns: A CAShapeLayer object rappresenting the arc
     
    */
    private func createArc(center: CGPoint, radius: CGFloat, strokeEnd: CGFloat, color: UInt, colorAlpha: CGFloat, width: CGFloat) -> CAShapeLayer {
        let startAngle = 3 * (Double.pi / 2)
        let ARC_PATH = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(startAngle - 0.01), clockwise: true)
        let ARC_LAYER = CAShapeLayer()
        ARC_LAYER.path = ARC_PATH.cgPath
        ARC_LAYER.fillColor = UIColor.clear.cgColor
        ARC_LAYER.strokeColor = UIColor().UIColorFromRGB(rgbValue: color, alpha: colorAlpha).cgColor
        ARC_LAYER.lineWidth = width
        ARC_LAYER.lineCap = .round
        ARC_LAYER.strokeEnd = strokeEnd
        
        return ARC_LAYER
    }
    
    /**
        Animates the progress bar stroke
     
        - Parameters:
            - duration: The animation duration
            - value: The value where the stroke have to end, between 0.0 and 1.0
     */
    func setProgressWithAnimation(duration: TimeInterval, value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        //animation.fromValue = strokePosition
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        arcLayer.strokeEnd = CGFloat(value)
        arcLayer.add(animation, forKey: "animateprogress")
    }
}

//
//  SonarAnnotationView.swift
//  MapLocationAnimation
//
//  Created by zhai on 16/9/1.
//  Copyright © 2016年 zhai. All rights reserved.
//

import UIKit
import MapKit

class SonarAnnotationView:  MKAnnotationView {
    
    struct Constans {
        struct ColorPalette {
            static let green = UIColor(red:0.0,green: 0.87,blue: 0.71,alpha: 1.0)
        }
    }

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation:annotation,reuseIdentifier:reuseIdentifier)
        startAnimation()
    }
    
    required override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimation()  {
        sonar(CACurrentMediaTime())
        sonar(CACurrentMediaTime() + 0.92)
        sonar(CACurrentMediaTime() + 1.84)
    }
    
    func sonar(beginTime: CFTimeInterval){
        let circlePath1 = UIBezierPath(arcCenter: self.center, radius: CGFloat(3), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let circlePath2 = UIBezierPath(arcCenter: self.center, radius: CGFloat(80), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = Constans.ColorPalette.green.CGColor
        shapeLayer.fillColor = Constans.ColorPalette.green.CGColor
        shapeLayer.path = circlePath1.CGPath
        self.layer.addSublayer(shapeLayer)
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.fromValue = circlePath1.CGPath
        pathAnimation.toValue = circlePath2.CGPath
        
        
        let alphaAnimation = CABasicAnimation(keyPath:"opacity")
        alphaAnimation.fromValue = 0.8
        alphaAnimation.toValue = 0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.beginTime = beginTime
        animationGroup.animations = [pathAnimation, alphaAnimation]
        animationGroup.duration = 2.76
        animationGroup.repeatCount = FLT_MAX
        animationGroup.delegate = self
        animationGroup.removedOnCompletion = false
        animationGroup.fillMode = kCAFillModeForwards
        
        shapeLayer.addAnimation(animationGroup, forKey: "sonar")
    }
}

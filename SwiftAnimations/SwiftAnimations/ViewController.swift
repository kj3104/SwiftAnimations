//
//  ViewController.swift
//  SwiftAnimations
//
//  Created by Kaji Satoshi on 2017/01/19.
//  Copyright © 2017年 Kaji Satoshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animateView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        drawCircle(start: 0.0, end: CGFloat(M_PI)*2, radius: 100, fillColor: UIColor.gray.cgColor)
        drawCircle(start: 0.0, end: CGFloat(M_PI)*2, radius: 90, fillColor: UIColor.white.cgColor)
        
        drawCircleAnim(start:0.0-CGFloat(M_PI/2), end: CGFloat(M_PI*4/3), radius: 95, strokeColor: UIColor.magenta.cgColor, lineWidth: 10)
        drawCircleAnim(start:0.0-CGFloat(M_PI/2), end: CGFloat(M_PI), radius: 95, strokeColor: UIColor.orange.cgColor, lineWidth: 10)
        drawCircleAnim(start:0.0-CGFloat(M_PI/2), end: CGFloat(M_PI/2), radius: 95, strokeColor: UIColor.cyan.cgColor, lineWidth: 10)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawCircle(start:CGFloat, end:CGFloat, radius: CGFloat, fillColor:CGColor){
        
        let path: UIBezierPath = UIBezierPath();
        path.move(to: CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2))
        path.addArc(withCenter: CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2), radius: radius, startAngle: start, endAngle: end, clockwise: true)
        
        let layer = CAShapeLayer()
        layer.fillColor = fillColor
        layer.path = path.cgPath
        
        self.view.layer.addSublayer(layer)
    }
    
    func drawCircleAnim(start:CGFloat, end:CGFloat, radius:CGFloat, strokeColor:CGColor, lineWidth:CGFloat){
        
        let path: UIBezierPath = UIBezierPath(arcCenter: CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2), radius: radius, startAngle: start, endAngle: end, clockwise: true)
        
        
        path.lineWidth = 1.0
        let lineLayer = CAShapeLayer()
        lineLayer.strokeColor = strokeColor
        lineLayer.lineWidth = lineWidth
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.path = path.cgPath
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        
        view.layer.addSublayer(lineLayer)
        lineLayer.add(animation, forKey: nil)
    }
    
    func moveBox(){
        self.animateView.center = self.view.center
        self.animateView.alpha = 0.0
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
            self.animateView.center.y += 100.0
            self.animateView.alpha = 1.0
            
        }, completion: nil)
    }

    func drawLine(){
        let path = UIBezierPath()
        path.move(to: CGPoint(x: view.frame.maxX, y: view.frame.minY))
        path.addLine(to: CGPoint(x: view.frame.minX, y: view.frame.maxY))
        
        path.lineWidth = 1.0
        let lineLayer = CAShapeLayer()
        lineLayer.strokeColor = UIColor.blue.cgColor
        lineLayer.lineWidth = 1.0
        lineLayer.path = path.cgPath
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        
        view.layer.addSublayer(lineLayer)
        lineLayer.add(animation, forKey: nil)
    }

}


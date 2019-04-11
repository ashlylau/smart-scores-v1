//
//  ViewController.swift
//  SmartScoresV1
//
//  Created by Ashly Lau on 28/3/19.
//  Copyright © 2019 Ashly Lau. All rights reserved.
//

import UIKit

class Canvas: UIView {
    override func draw(_ rect: CGRect) {
        //custom drawing
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else
            { return }
        
        // here are my lines
        // dummy data
//        let startPoint = CGPoint(x: 0, y: 0)
//        let endPoint = CGPoint(x: 100, y: 100)
//
//        context.move(to: startPoint)
//        context.addLine(to: endPoint)
        
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(5)
        context.setLineCap(.butt)
        
        lines.forEach { (line) in
            for (i, p) in line.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
        }
        
        context.strokePath()
    }
    
    var lines = [[CGPoint]]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    //track finger as we move across the screen
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else {
            return
        }
//        print(point)
        
        guard var lastLine = lines.popLast() else { return }
        lastLine.append(point)
        
        lines.append(lastLine)
        
        setNeedsDisplay()
    }
}

class ViewController: UIViewController {
    
    let canvas = Canvas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = view.frame
    }
}


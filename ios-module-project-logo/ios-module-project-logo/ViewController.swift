//
//  ViewController.swift
//  ios-module-project-logo
//
//  Created by FGT MAC on 2/15/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit


@IBDesignable
class Canvas: UIView {
    
    override func draw(_ rect: CGRect) {
        //Custome draing
        super.draw(rect)
        
        //Unwrap context
        guard let context = UIGraphicsGetCurrentContext() else { return  }
        
        //testing
//        let startPoint = CGPoint(x: 200, y: 200)
//        let endPoint = CGPoint(x: 100, y: 100)
//
//        context.move(to: startPoint)
//        context.addLine(to: endPoint)
        
        //Change the color
        context.setStrokeColor(UIColor.red.cgColor)
        
        //Adjust the tickness
        context.setLineWidth(10)
        
        //Draw the lines by iterating on the array with the index
        //Nested loop to draw each of the lines inside the lines array which is a 2d array
        lines.forEach { (line) in
            
            for (i, p) in line.enumerated(){
                if i == 0{
                    context.move(to: p)
                }else{
                    context.addLine(to: p)
                }
            }
        }
        
        
        context.strokePath()
        
    }
    
    //track line by initializing an empty array of CGPoints
    //    var line = [CGPoint]()
    
    //this is so that we can draw multiple lines other while it will be a continues line
    var lines = [[CGPoint]]()
    
    
    //THIS will append multiple lines
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    
    //Track finger as we move across the screen
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let point = touches.first?.location(in: nil) else {return}
        
        //Removes the last line and append it
        guard var lastLine = lines.popLast() else { return }
        lastLine.append(point)
        
        //added back
        lines.append(lastLine)

//        print(point)
//        line.append(point)
        
        //Redraw to show lines while touching
        setNeedsDisplay()
        
    }
}

class ViewController: UIViewController {

    let canvas = Canvas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        view.addSubview(canvas)
        canvas.frame = view.frame
        //Set the view background color to white
        canvas.backgroundColor = .white
    }


}


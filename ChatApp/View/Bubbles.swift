//
//  BubbleView.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 20.04.23.
//

import UIKit

class Bubbles: UIView {
    
    private var radius: CGFloat {
        bounds.height/2
    }
    
    //    let isCircle = false
    private let bubbleType: BubbleType
    
    private var bubbleColor: UIColor {
        bubbleType == .recipient ? bubbleRecipientColor : bubbleSenserColor
    }
    
    init(for type: BubbleType) {
        bubbleType = type
        super.init(frame: .zero)
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("storyboard and .xib is not supported")
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: radius, y: 0))
        path.addLine(to: CGPoint(x: self.bounds.width - radius, y: 0))
        path.addArc(withCenter: CGPoint(x: self.bounds.width - radius, y: radius), radius: radius, startAngle: 3 * .pi / 2, endAngle: 0, clockwise: true)
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height - radius))
        path.addArc(withCenter: CGPoint(x: self.bounds.width - radius, y: self.bounds.height - radius), radius: radius, startAngle: 0, endAngle: .pi / 2, clockwise: true)
        path.addLine(to: CGPoint(x: radius, y: self.bounds.height))
        path.addArc(withCenter: CGPoint(x: radius, y: self.bounds.height - radius), radius: radius, startAngle: .pi / 2, endAngle: .pi, clockwise: true)
        path.addLine(to: CGPoint(x: 0, y: radius))
        path.addArc(withCenter: CGPoint(x: radius, y: radius), radius: radius, startAngle: .pi, endAngle: 3 * .pi / 2, clockwise: true)
        
        bubbleColor.setFill()
        path.fill()
    }
    
    class MediumBubble: Bubbles {
        // subclass definition goes here
        override var bubbleColor: UIColor  {
            bubbleType == .recipient ? bubbleRecipientColor : bubbleSenserColor
        }
        
        override func draw(_ rect: CGRect) {
            
            let path = UIBezierPath()
            
            path.move(to: CGPoint(x: radius, y: 0))
            path.addLine(to: CGPoint(x: self.bounds.width - radius, y: 0))
            path.addArc(withCenter: CGPoint(x: self.bounds.width - radius, y: radius), radius: radius, startAngle: 3 * .pi / 2, endAngle: 0, clockwise: true)
            path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height - radius))
            path.addArc(withCenter: CGPoint(x: self.bounds.width - radius, y: self.bounds.height - radius), radius: radius, startAngle: 0, endAngle: .pi / 2, clockwise: true)
            path.addLine(to: CGPoint(x: radius, y: self.bounds.height))
            path.addArc(withCenter: CGPoint(x: radius, y: self.bounds.height - radius), radius: radius, startAngle: .pi / 2, endAngle: .pi, clockwise: true)
            path.addLine(to: CGPoint(x: 0, y: radius))
            path.addArc(withCenter: CGPoint(x: radius, y: radius), radius: radius, startAngle: .pi, endAngle: 3 * .pi / 2, clockwise: true)
            
            bubbleColor.setFill()
            path.fill()
        }
    }
    
    class SmallBubble: Bubbles {
        
        override var bubbleColor: UIColor  {
            bubbleType == .recipient ? bubbleRecipientColor : bubbleSenserColor
        }
        
        override func draw(_ rect: CGRect) {
            
            let path = UIBezierPath()
            
            path.move(to: CGPoint(x: radius, y: 0))
            path.addLine(to: CGPoint(x: self.bounds.width - radius, y: 0))
            path.addArc(withCenter: CGPoint(x: self.bounds.width - radius, y: radius), radius: radius, startAngle: 3 * .pi / 2, endAngle: 0, clockwise: true)
            path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height - radius))
            path.addArc(withCenter: CGPoint(x: self.bounds.width - radius, y: self.bounds.height - radius), radius: radius, startAngle: 0, endAngle: .pi / 2, clockwise: true)
            path.addLine(to: CGPoint(x: radius, y: self.bounds.height))
            path.addArc(withCenter: CGPoint(x: radius, y: self.bounds.height - radius), radius: radius, startAngle: .pi / 2, endAngle: .pi, clockwise: true)
            path.addLine(to: CGPoint(x: 0, y: radius))
            path.addArc(withCenter: CGPoint(x: radius, y: radius), radius: radius, startAngle: .pi, endAngle: 3 * .pi / 2, clockwise: true)
            
            bubbleColor.setFill()
            path.fill()
        }
    }
}

extension Bubbles {
    enum BubbleType {
        case sender
        case recipient
    }
}

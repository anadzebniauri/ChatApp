//
//  BubbleView.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 20.04.23.
//

import UIKit

// MARK: - Bubbles

class RecipientCapsuleBubble: UIView {
    
    private var radius: CGFloat {
        bounds.height/2
    }
    
    //    private var bubbleType: BubbleType
    //
    //    init(for type: BubbleType) {
    //        bubbleType = type
    //        super.init(frame: .zero)
    //        backgroundColor = .clear
    //    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("storyboard and .xib is not supported")
    }
    
    override required init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .clear
        
    }
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: radius, y: 0))
        path.addLine(to: CGPoint(x: bounds.width - radius, y: 0))
        path.addArc(
            withCenter: CGPoint(x: bounds.width - radius, y: radius),
            radius: radius,
            startAngle: 3 * .pi / 2,
            endAngle: 0, clockwise: true
        )
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height - radius))
        path.addArc(
            withCenter: CGPoint(x: bounds.width - radius, y: bounds.height - radius),
            radius: radius,
            startAngle: 0,
            endAngle: .pi / 2,
            clockwise: true
        )
        path.addLine(to: CGPoint(x: radius, y: bounds.height))
        path.addArc(
            withCenter: CGPoint(x: radius, y: bounds.height - radius),
            radius: radius,
            startAngle: .pi / 2,
            endAngle: .pi,
            clockwise: true
        )
        path.addLine(to: CGPoint(x: 0, y: radius))
        path.addArc(
            withCenter: CGPoint(x: radius, y: radius),
            radius: radius,
            startAngle: .pi,
            endAngle: 3 * .pi / 2,
            clockwise: true
        )
        
        UIColor.recipientColor.setFill()
        path.fill()
    }
}

// MARK: - Bubble
class RecipientBubble: UIView {
    // subclass definition goes here
    private var radius: CGFloat {
        bounds.height/2
    }
    
    //    private let type: BubbleType
    
    //    init(for type: BubbleType) {
    //        self.type = type
    //        super.init(frame: .zero)
    //        backgroundColor = .clear
    //    }
    
    
    override required init(frame: CGRect) {
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
        
        UIColor.recipientColor.setFill()
        path.fill()
    }
}


//enum BubbleType {
//    case sender
//    case recipient
//
//    var color: UIColor {
//        switch self {
//        case .recipient:
//
//            return .recipientColor
//        case .sender:
//            return .senderColor
//        }
//    }
//}


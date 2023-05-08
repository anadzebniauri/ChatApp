//
//  BubbleView.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 20.04.23.
//

import UIKit

final class RecipientCapsuleBubbleView: UIView {
    
    private var radius: CGFloat {
        Constants.radius
    }
    
    //MARK: - Init
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
        
        Constants.recipientBubbleColor.setFill()
        path.fill()
    }
}

//MARK: - Constans
private extension RecipientCapsuleBubbleView {
    enum Constants {
        static let radius = 25.0
        static let recipientBubbleColor = UIColor(red: 241, green: 241, blue: 241, alpha: 1)
    }
}

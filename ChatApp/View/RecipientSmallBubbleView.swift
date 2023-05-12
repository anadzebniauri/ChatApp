//
//  RecipientSmallBubbleView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 04.05.23.
//

import UIKit

final class RecipientSmallBubbleView: UIView {
    
    private var radius: CGFloat {
        Constants.radius
    }
    
    //MARK: - Init
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
        path.addArc(withCenter: CGPoint(x: self.bounds.width - radius,
                                        y: radius),
                    radius: radius,
                    startAngle: 3 * .pi / 2,
                    endAngle: 0,
                    clockwise: true
        )
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height - radius))
        path.addArc(withCenter: CGPoint(x: self.bounds.width - radius,
                                        y: self.bounds.height - radius),
                    radius: radius,
                    startAngle: 0,
                    endAngle: .pi / 2,
                    clockwise: true
        )
        path.addLine(to: CGPoint(x: radius, y: self.bounds.height))
        path.addArc(withCenter: CGPoint(x: radius,
                                        y: self.bounds.height - radius),
                    radius: radius,
                    startAngle: .pi / 2,
                    endAngle: .pi,
                    clockwise: true
        )
        path.addLine(to: CGPoint(x: 0, y: radius))
        path.addArc(withCenter: CGPoint(x: radius, y: radius),
                    radius: radius,
                    startAngle: .pi,
                    endAngle: 3 * .pi / 2,
                    clockwise: true
        )
        
        Constants.recipientBubbleColor.setFill()
        path.fill()
    }
}

//MARK: - Constants
private extension RecipientSmallBubbleView {
    enum Constants {
        static let radius = 5.0
        static let recipientBubbleColor = UIColor(red: 241, green: 241, blue: 241, alpha: 1)
    }
}


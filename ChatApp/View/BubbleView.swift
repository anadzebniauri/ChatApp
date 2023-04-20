//
//  BubbleView.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 20.04.23.
//

import UIKit

class Bubbles: UIView {

    var path: UIBezierPath!

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.red
    }

    required init?(coder aDecor: NSCoder) {
        super.init(coder: aDecor)
    }

    func createBubble() {
        path = UIBezierPath()

        path.move(to: CGPoint(x: 0.0, y:0.0))

        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height ))

        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height  ))

        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))

        path.close()
    }

    override func draw(_ rect: CGRect) {
        self.createBubble()

        UIColor.orange.setFill()
        path.fill()

        UIColor.blue.setStroke()
        path.stroke()
    }
}


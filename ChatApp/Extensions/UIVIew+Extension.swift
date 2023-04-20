//
//  UIView+Extension.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 19.04.23.
//

import UIKit

extension UIView {
    func stretch(on parentView: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: parentView.topAnchor),
            bottomAnchor.constraint(equalTo: parentView.bottomAnchor),
            rightAnchor.constraint(equalTo: parentView.rightAnchor),
            leftAnchor.constraint(equalTo: parentView.leftAnchor),
        ])
    }
    
    func stretchOnParent() {
        guard let superview = superview else { return }
        stretch(on: superview)
    }
    
    func setHeight(_ height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setWidth(_ width: CGFloat) {
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    /// View should be square at first
    func becameCircle() {
        layer.cornerRadius = layer.bounds.width / 2
    }
    
    // MARK: - Centring
    func centre(in parentView: UIView) {
        centreVertically(in: parentView)
        centreHorizontally(in: parentView)
    }
    
    func centreInParent() {
        guard let superview = superview else { return }
        centre(in: superview)
    }
    
    func centreVertically(in parentView: UIView) {
        centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
    }
    
    func centreVerticallyInParent() {
        guard let superview = superview else { return }
        centreVertically(in: superview)
    }
    
    func centreHorizontally(in parentView: UIView) {
        centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
    }
    
    func centreHorizontallyInParent() {
        guard let superview = superview else { return }
        centreHorizontally(in: superview)
    }
    
}

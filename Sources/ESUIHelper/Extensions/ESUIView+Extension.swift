//
//  ESUIView+Extension.swift
//  ESUIHelper
//
//  Created by Emil Karimov on 11/06/2020
//  Copyright © 2020 ESKARIA LLC. All rights reserved.
//

import UIKit

public extension UIView {
    
    /// Apply gradient to view layer
    /// - Parameters:
    ///   - start: start color
    ///   - end: end color
    ///   - locations: position
    ///   - startPoint: start point
    ///   - endPoint: end point
    ///   - rounded:
    func applyGradient(start: UIColor, end: UIColor, locations: [NSNumber]? = [0.0, 0.8], startPoint: CGPoint = CGPoint(x: 0, y: 0.5), endPoint: CGPoint = CGPoint(x: 1, y: 0.5), rounded: Bool = true) -> Void {
        applyGradient(colours: [start, end], locations: locations, startPoint: startPoint, endPoint: endPoint, rounded: rounded)
    }

    private func applyGradient(colours: [UIColor], locations: [NSNumber]?, startPoint: CGPoint, endPoint: CGPoint, rounded: Bool) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint

        if let layer = layer.sublayers?.first {
            if layer is CAGradientLayer {
                layer.removeFromSuperlayer()
            }
        }

        layer.insertSublayer(gradient, at: 0)
        if rounded {
            cornerRadius(frame.height / 2)
        }
    }
    
    /// Set corner radius
    /// - Parameter radius: radius of corners
    func cornerRadius(_ radius: CGFloat = 10) {
        layer.cornerRadius = radius
        layer.masksToBounds = radius > 0
    }
    
    /// Set rounded corner radius
    func round() {
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = layer.cornerRadius > 0
    }

    /// Set Borders to View
    ///
    /// - Parameters:
    ///   - borderColor: Color of border
    ///   - borderWidth: Width of border
    func setBorders(borderColor: UIColor, borderWidth: CGFloat) {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }

    /// Remove borders
    func removeBorders() {
        layer.borderWidth = 0
        layer.borderColor = UIColor.clear.cgColor
    }
}

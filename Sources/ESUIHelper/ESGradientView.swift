//
//  ESGradientView.swift
//  ESUIHelper
//
//  Created by Emil Karimov on 11/06/2020
//  Copyright © 2020 ESKARIA LLC. All rights reserved.
//

import UIKit

public enum ESGradientDirection {

    case top
    case left
    case right
    case bottom

    case topLeft
    case topRight

    case bottomLeft
    case bottomRight

    public var startPoint: CGPoint {
        switch self {
        case .top:
            return CGPoint(x: 0.5, y: 1)
        case .left:
            return CGPoint(x: 1, y: 0.5)
        case .right:
            return CGPoint(x: 0, y: 0.5)
        case .bottom:
            return CGPoint(x: 0.5, y: 0)
        case .topLeft:
            return CGPoint(x: 1, y: 1)
        case .topRight:
            return CGPoint(x: 0, y: 1)
        case .bottomLeft:
            return CGPoint(x: 0, y: 0)
        case .bottomRight:
            return CGPoint(x: 1, y: 0)
        }
    }

    public var endPoint: CGPoint {
        switch self {
        case .top:
            return CGPoint(x: 0.5, y: 0)
        case .left:
            return CGPoint(x: 0, y: 0.5)
        case .right:
            return CGPoint(x: 1, y: 0.5)
        case .bottom:
            return CGPoint(x: 0.5, y: 1)
        case .topLeft:
            return CGPoint(x: 0, y: 0)
        case .topRight:
            return CGPoint(x: 1, y: 0)
        case .bottomLeft:
            return CGPoint(x: 0, y: 1)
        case .bottomRight:
            return CGPoint(x: 1, y: 1)
        }
    }
}

/// Configuration struct
public struct ESGradientConfiguration {

    /// colors
    public let startColor: UIColor
    public let endColor: UIColor

    /// shadow
    public var shadowColor: UIColor = .clear
    public var shadowX: CGFloat = 0
    public var shadowY: CGFloat = -3
    public var shadowBlur: CGFloat = 3

    /// direction
    public var startPointX: CGFloat = 0
    public var endPointX: CGFloat = 1

    public var startPointY: CGFloat = 1
    public var endPointY: CGFloat = 0

    public var cornerRadius: CGFloat = 0

    public init(startColor: UIColor, endColor: UIColor, direction: ESGradientDirection? = nil, startPoint: CGPoint = ESGradientDirection.top.startPoint, endPoint: CGPoint = ESGradientDirection.top.endPoint) {
        self.startColor = startColor
        self.endColor = endColor

        guard let direction = direction else {
            startPointX = startPoint.x
            startPointY = startPoint.y

            endPointX = endPoint.x
            endPointY = endPoint.y
            return
        }

        startPointX = direction.startPoint.x
        startPointY = direction.startPoint.y

        endPointX = direction.endPoint.x
        endPointY = direction.endPoint.y

    }

}

public class ESGradientView: UIView {

    private var gradientLayer: CAGradientLayer!

    var startColor: UIColor = .yellow {
        didSet {
            setNeedsLayout()
        }
    }

    var endColor: UIColor = .red {
        didSet {
            setNeedsLayout()
        }
    }

    var shadowColor: UIColor = .clear {
        didSet {
            setNeedsLayout()
        }
    }

    var shadowX: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }

    var shadowY: CGFloat = -3 {
        didSet {
            setNeedsLayout()
        }
    }

    var shadowBlur: CGFloat = 3 {
        didSet {
            setNeedsLayout()
        }
    }

    var startPointX: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }

    var startPointY: CGFloat = 1 {
        didSet {
            setNeedsLayout()
        }
    }

    var endPointX: CGFloat = 1 {
        didSet {
            setNeedsLayout()
        }
    }

    var endPointY: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }

    var cornerRadius: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }

    public init(_ config: ESGradientConfiguration) {
        super.init(frame: .zero)

        startColor = config.startColor
        endColor = config.endColor

        shadowColor = config.shadowColor
        shadowX = config.shadowX
        shadowY = config.shadowY
        shadowBlur = config.shadowBlur

        startPointX = config.startPointX
        endPointX = config.endPointX

        startPointY = config.startPointY
        endPointY = config.endPointY

        cornerRadius = config.cornerRadius

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    override public func layoutSubviews() {
        gradientLayer = layer as? CAGradientLayer
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
        gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowX, height: shadowY)
        layer.shadowRadius = shadowBlur
        layer.shadowOpacity = 1

    }

    public func animate(duration: TimeInterval, newTopColor: UIColor, newBottomColor: UIColor) {
        let fromColors = gradientLayer?.colors
        let toColors: [AnyObject] = [newTopColor.cgColor, newBottomColor.cgColor]
        gradientLayer?.colors = toColors
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = fromColors
        animation.toValue = toColors
        animation.duration = duration
        animation.isRemovedOnCompletion = true
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        gradientLayer?.add(animation, forKey: "animateGradient")
    }
}

//
//  ESButton.swift
//  ESUIHelper
//
//  Created by Emil Karimov on 11/06/2020
//  Copyright © 2020 ESKARIA LLC. All rights reserved.
//

import UIKit

public enum ESSelectionType {
    case select
    case unselect
}

open class ESButton: UIButton {

    public override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        if title(for: .normal) != nil {
            let inset: CGFloat = 6
            let sideSize = frame.height - inset * 2
            let titleFrame = titleRect(forContentRect: contentRect)
            return CGRect.init(x: titleFrame.origin.x - sideSize - 6, y: 0, width: sideSize, height: frame.height)
        } else {
            return super.imageRect(forContentRect: contentRect)
        }
    }

    public override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                imageView?.alpha = 0.7
            } else {
                imageView?.alpha = 1
            }
        }
    }

    public var rounded: Bool = false {
        didSet {
            layoutSubviews()
        }
    }

    public init() {
        super.init(frame: CGRect.zero)
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    internal func commonInit() {
        adjustsImageWhenHighlighted = false
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        if rounded {
            round()
        }
    }

    public func set(enable: Bool, animatable: Bool) {
        isEnabled = enable
        if animatable {
            ESAnimation.animate(0.3, animations: {
                self.alpha = enable ? 1 : 0.6
            })
        } else {
            alpha = enable ? 1 : 0.6
        }
    }
}

extension UIButton {

    public  typealias UIButtonTargetClosure = () -> Void

    private class ClosureWrapper: NSObject {
        let closure: UIButtonTargetClosure
        init(_ closure: @escaping UIButtonTargetClosure) {
            self.closure = closure
        }
    }

    private struct AssociatedKeys {
        static var targetClosure = "targetClosure"
    }

    private var targetClosure: UIButtonTargetClosure? {
        get {
            guard let closureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.targetClosure) as? ClosureWrapper else { return nil }
            return closureWrapper.closure
        }
        set(newValue) {
            guard let newValue = newValue else { return }
            objc_setAssociatedObject(self, &AssociatedKeys.targetClosure, ClosureWrapper(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    public func target(_ action: @escaping UIButtonTargetClosure) {
        targetClosure = action
        addTarget(self, action: #selector(UIButton.targetAction), for: .touchUpInside)
    }

    @objc func targetAction() {
        guard let targetClosure = targetClosure else { return }
        targetClosure()
    }
}

extension UIButton {

    public func setTitle(_ title: String, color: UIColor? = nil) {
        setTitle(title, for: .normal)
        if let color = color {
            setTitleColor(color)
        }
    }

    public func setTitleColor(_ color: UIColor) {
        setTitleColor(color, for: .normal)
        setTitleColor(color.withAlphaComponent(0.7), for: .highlighted)
    }

    public func setImage(_ image: UIImage) {
        setImage(image, for: .normal)
        imageView?.contentMode = .scaleAspectFit
    }

    public func removeAllTargets() {
        removeTarget(nil, action: nil, for: .allEvents)
    }

    public func showText(_ text: String, withComplection completion: (() -> Void)! = {}) {
        let baseText = titleLabel?.text ?? " "
        ESAnimation.animate(0.2, animations: {
            self.titleLabel?.alpha = 0
        }, withComplection: {
            self.setTitle(text, for: .normal)
            ESAnimation.animate(0.2, animations: {
                self.titleLabel?.alpha = 1
            }, withComplection: {
                ESAnimation.animate(0.2, animations: {
                    self.titleLabel?.alpha = 0
                }, delay: 0.35,
                   withComplection: {
                    self.setTitle(baseText, for: .normal)
                    ESAnimation.animate(0.2, animations: {
                        self.titleLabel?.alpha = 1
                    }, withComplection: {
                        completion()
                    })
                })
            })
        })
    }

    public func setAnimatableText(_ text: String, withComplection completion: (() -> Void)! = {}) {
        ESAnimation.animate(0.3, animations: {
            self.titleLabel?.alpha = 0
        }, withComplection: {
            self.setTitle(text, for: .normal)
            ESAnimation.animate(0.3, animations: {
                self.titleLabel?.alpha = 1
            }, withComplection: {
                completion()
            })
        })
    }

    public func hideContent(completion: (() -> Void)! = {}) {
        ESAnimation.animate(0.25, animations: {
            self.titleLabel?.alpha = 0
        }, withComplection: {
             completion()
        })
    }

    public func showContent(completion: (() -> Void)! = {}) {
        ESAnimation.animate(0.25, animations: {
            self.titleLabel?.alpha = 1
        }, withComplection: {
            completion()
        })
    }
}

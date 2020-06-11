//
//  ESAppleMusicButton.swift
//  ESUIHelper
//
//  Created by Emil Karimov on 11/06/2020
//  Copyright © 2020 ESKARIA LLC. All rights reserved.
//

import UIKit

open class ESAppleMusicButton: ESButton {

    public var type: ESSelectionType = .unselect {
        didSet {
            updateType(animated: false)
        }
    }

    public var selectColor = UIColor(hex: "FD2D55") {
        didSet {
            updateType(animated: false)
        }
    }

    public var baseColor = UIColor(hex: "F8F7FC") {
        didSet {
            updateType(animated: false)
        }
    }

    open override func commonInit() {
        super.commonInit()
        layer.cornerRadius = 8
        titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        contentEdgeInsets = UIEdgeInsets.init(top: 12, left: 27, bottom: 12, right: 27)
        type = .unselect
    }

    private func updateType(animated: Bool) {
        switch type {
        case .select:
            backgroundColor = selectColor
            setTitleColor(UIColor.white)
        case .unselect:
            backgroundColor = baseColor
            setTitleColor(selectColor)
        }
    }
}

//
//  ESIconLabelView.swift
//  ESUIHelper
//
//  Created by Emil Karimov on 11/06/2020
//  Copyright © 2020 ESKARIA LLC. All rights reserved.
//

import UIKit

public class ESIconLabelView: UIView {

    public var label: UILabel = UILabel()
    public var iconView: UIImageView! = nil
    var insets: UIEdgeInsets?

    public convenience init() {
        self.init(frame: .zero)
    }
    public convenience init(icon: UIImage = UIImage(), text: String? = nil, insets: UIEdgeInsets = UIEdgeInsets.zero) {

        self.init()
        label.text = text
        label.numberOfLines = 0
        iconView = UIImageView(image: icon)
        iconView.contentMode = .scaleAspectFit
        self.insets = insets

        let container = UIView()
        addSubview(container)
        
        container.topAnchor.constraint(equalTo: topAnchor, constant: insets.top).isActive = true
        container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom).isActive = true
        container.leftAnchor.constraint(equalTo: leftAnchor, constant: insets.left).isActive = true
        container.rightAnchor.constraint(equalTo: rightAnchor, constant: insets.right).isActive = true
       
        container.addSubview(iconView)
        
        iconView.topAnchor.constraint(equalTo: container.topAnchor, constant: 2).isActive = true
        iconView.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 13).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 13).isActive = true

        container.addSubview(label)
        
        label.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: iconView.leftAnchor, constant: 8).isActive = true
        label.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setText(_ text: String, uppercased: Bool = false) {
        label.text = uppercased ? text.uppercased() : text
    }
}

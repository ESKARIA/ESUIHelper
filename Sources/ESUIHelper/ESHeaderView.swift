//
//  ESHeaderView.swift
//  ESUIHelper
//
//  Created by Emil Karimov on 11/06/2020
//  Copyright © 2020 ESKARIA LLC. All rights reserved.
//

import UIKit

public class ESHeaderView: UIView {

    // MARK: - Properties

    public var label: UILabel = UILabel()
    var detailLabel: UILabel = UILabel()

    // MARK: - Lyfe cycle

    public convenience init() {
        self.init(frame: .zero)
    }

    public convenience init(text: String?, uppercased: Bool = true) {
        self.init()
        label.text = uppercased ? text?.uppercased() : text

    }

    public override init(frame: CGRect) {
        super.init(frame: frame)

        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor.gray

        detailLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        detailLabel.textColor = UIColor.gray

        label.numberOfLines = 0
        backgroundColor = UIColor.RGB(r: 239, g: 239, b: 244)
        addSubview(label)
        
        label.topAnchor.constraint(equalTo: topAnchor, constant: 23).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        
        addSubview(detailLabel)
        detailLabel.numberOfLines = 1
        
        detailLabel.topAnchor.constraint(equalTo: label.topAnchor).isActive = true
        detailLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor.RGB(r: 210, g: 210, b: 210)
        addSubview(separatorView)
        
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        separatorView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Custom accessors

    public func updateTitle(_ text: String?, uppercased: Bool = true) {
        label.text = uppercased ? text?.uppercased() : text
    }

    public func setTitleDetailValue(_ title: String, _ details: String? = nil, uppercasedTitle: Bool = false, uppercasedDetail: Bool = false) {
        label.text = uppercasedTitle ? title.uppercased() : title
        if let detailsText = details {
            detailLabel.text = uppercasedDetail ? detailsText.uppercased() : detailsText
        }
    }
}

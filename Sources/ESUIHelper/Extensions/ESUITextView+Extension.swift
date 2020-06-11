//
//  ESUITextView+Extension.swift
//  ESUIHelper
//
//  Created by Emil Karimov on 11/06/2020
//  Copyright © 2020 ESKARIA LLC. All rights reserved.
//

import UIKit

public extension UITextView {
    
    static func makeTextView(size: CGFloat = 13, weight: UIFont.Weight = .regular, textColor: UIColor) -> UITextView {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: size, weight: weight)
        textView.textColor = textColor
        return textView
    }
}

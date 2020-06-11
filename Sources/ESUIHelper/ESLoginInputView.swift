//
//  ESLoginInputView.swift
//  ESUIHelper
//
//  Created by Emil Karimov on 11/06/2020
//  Copyright © 2020 ESKARIA LLC. All rights reserved.
//

import UIKit

public class ESLoginInputView: UIView {
    
    public var imageViewIcon = UIImageView()
    
    public var textField = UITextField()
    private var separator = UIView()
    
    public func setPlaceholder(_ placeHolder: String, textColor: UIColor? = nil) {
        
        if let color = textColor {
            
            let attribute = [NSAttributedString.Key.foregroundColor: color]
            let string = NSAttributedString(string: placeHolder, attributes: attribute)
            textField.attributedPlaceholder = string
        } else if let color = textField.textColor {
            
            let attribute = [NSAttributedString.Key.foregroundColor: color.withAlphaComponent(0.8)]
            let string = NSAttributedString(string: placeHolder, attributes: attribute)
            textField.attributedPlaceholder = string
        } else {
            
            textField.placeholder = placeHolder
        }
    }

    public convenience init(color: UIColor, keyboardType: UIKeyboardType) {
        
        self.init(frame: .zero)
        imageViewIcon.translatesAutoresizingMaskIntoConstraints = false
        imageViewIcon.contentMode = .center
        imageViewIcon.image? = (imageViewIcon.image?.withRenderingMode(.alwaysTemplate))!
        imageViewIcon.layer.cornerRadius = 34 / 2
        imageViewIcon.layer.masksToBounds = true
        imageViewIcon.backgroundColor = color
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textAlignment = .left
        
        textField.textColor = UIColor.black.withAlphaComponent(0.8)
        textField.tintColor = color
        textField.keyboardType = .emailAddress
        addSubview(imageViewIcon)
        addSubview(textField)
        
        imageViewIcon.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageViewIcon.centerYAnchor.constraint(equalTo: textField.centerYAnchor).isActive = true
        imageViewIcon.widthAnchor.constraint(equalToConstant: 34).isActive = true
        imageViewIcon.heightAnchor.constraint(equalToConstant: 34).isActive = true
      
        textField.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        textField.leftAnchor.constraint(equalTo: imageViewIcon.rightAnchor, constant: 10).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        let textFieldHeight = textField.heightAnchor.constraint(equalToConstant: 46)
        textFieldHeight.priority = .init(rawValue: 999)
        textFieldHeight.isActive = true
        
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = color.withAlphaComponent(0.8)
        addSubview(separator)
        
        separator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        separator.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separator.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.separator = separator
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ESLoginInputView.click(tapRecognizer:)))
        addGestureRecognizer(tapRecognizer)
    }
    
    public func setImage(_ image: UIImage){
        imageViewIcon.image = image
    }
    
    public func setSeparatorColor(_ color: UIColor = UIColor.white) {
        separator.backgroundColor = color
    }
    public func setSecureText(_ isSecure: Bool) {
        textField.isSecureTextEntry = isSecure
    }
    public func setKeyboardType(type: UIKeyboardType) {
        textField.keyboardType = type
    }
    
    public func getTextField() -> UITextField {
        return textField
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func click(tapRecognizer: UITapGestureRecognizer) {
        textField.becomeFirstResponder()
    }
    
    public override func resignFirstResponder() -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    public override func becomeFirstResponder() -> Bool {
        textField.becomeFirstResponder()
        return true
    }
    
    public override var canResignFirstResponder: Bool {
        return true
    }
    
    public override var canBecomeFirstResponder: Bool {
        return true
    }
    
}


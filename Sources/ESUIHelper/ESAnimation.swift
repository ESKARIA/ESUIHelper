//
//  ESAnimation.swift
//  ESUIHelper
//
//  Created by Emil Karimov on 11/06/2020
//  Copyright © 2020 ESKARIA LLC. All rights reserved.
//

import UIKit

public enum ESAnimation {
    
    public static func animate(_ duration: TimeInterval, animations: (() -> Void)!, delay: TimeInterval = 0, options: UIView.AnimationOptions = [], withComplection completion: (() -> Void)! = { }) {
        
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: options,
            animations: {
                animations()
        }, completion: { _ in
            completion()
        })
    }
    
    public static func animateWithRepeatition(_ duration: TimeInterval, animations: (() -> Void)!, delay: TimeInterval = 0, options: UIView.AnimationOptions = [], withComplection completion: (() -> Void)! = { }) {
        
        var optionsWithRepeatition = options
        optionsWithRepeatition.insert([.autoreverse, .repeat, .allowUserInteraction])
        
        animate(
            duration,
            animations: {
                animations()
        },
            delay: delay,
            options: optionsWithRepeatition,
            withComplection: {
                completion()
        })
    }
}

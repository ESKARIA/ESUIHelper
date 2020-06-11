//
//  ESUIImage+Extension.swift
//  ESUIHelper
//
//  Created by Emil Karimov on 11/06/2020
//  Copyright © 2020 ESKARIA LLC. All rights reserved.
//

import UIKit

public extension UIImage {
    
    /// Colorize image
    ///
    /// - Parameter color: new color for image
    /// - Returns: new colorized image
    func mask(with color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext() else { return self }
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(.normal)
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        guard let mask = cgImage else { return self }
        context.clip(to: rect, mask: mask)
        
        color.setFill()
        context.fill(rect)
        
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return self }
        return newImage
    }
}

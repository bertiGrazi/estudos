//
//  NSTextAttachment + Extension.swift
//  AppMusicBF
//
//  Created by Grazi  Berti on 17/11/22.
//

import Foundation
import UIKit

extension NSTextAttachment {
    func setImageHeight(height: CGFloat) {
        guard let image = image else { return }
        let ratio = image.size.width / image.size.height
        
        bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: ratio * height, height: height)
    }
}

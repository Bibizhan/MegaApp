//
//  TextFieldStyle.swift
//  MegaApp
//
//  Created by Bibizhan on 08.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func useUnderline() {
        let border = CALayer()
        let borderWidth = CGFloat(0.75)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(origin: CGPoint(x: 0,y :self.frame.size.height - borderWidth), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}

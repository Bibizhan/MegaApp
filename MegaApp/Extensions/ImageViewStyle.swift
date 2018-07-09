//
//  ImageViewStyle.swift
//  MegaApp
//
//  Created by Bibizhan on 05.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import UIKit

class RoundedImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height/2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
        self.clipsToBounds = true
    }
}


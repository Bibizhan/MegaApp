//
//  Extensions.swift
//  MegaApp
//
//  Created by Bibizhan on 05.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import UIKit

class RoundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 20
    }
}

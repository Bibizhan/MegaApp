//
//  RoundedLabel.swift
//  MegaApp
//
//  Created by Bibizhan on 07.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import UIKit

class RoundedLabel: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 15
    }
}

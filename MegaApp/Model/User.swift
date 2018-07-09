//
//  User.swift
//  MegaApp
//
//  Created by Bibizhan on 04.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import UIKit
struct User {
    
    var username: String
    var profilePhoto: UIImage
    var balance: String
    var city: String
    
}

protocol UserInfo {
    func userInfo(username: String, city: String, balance: String, profilePhoto: UIImage )
}

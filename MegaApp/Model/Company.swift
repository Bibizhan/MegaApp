//
//  Shop.swift
//  MegaApp
//
//  Created by Bibizhan on 04.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation

struct Company {
    
    let id: Int
    let name: String?
    let description: String?
    let logoUrl: String?
    
}

extension Company {
    init?(jsonDict: [String: Any]) {
        guard let id = jsonDict["id"] as? Int,
            let name = jsonDict["name"] as? String,
            let description = jsonDict["description"] as? String,
            let logoUrl = jsonDict["logoUrl"] as? String
            
            else {
                print("error")
                return nil
        }
        self.id = id
        self.name = name
        self.description = description
        self.logoUrl = logoUrl
        
    }
}



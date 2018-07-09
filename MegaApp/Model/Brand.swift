//
//  Brand.swift
//  MegaApp
//
//  Created by Bibizhan on 06.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation

struct Brand {
    
    let id: Int
    let name: String?
    let description: String?
    let logoUrl: String?
    let shopHeader: String?
    
}

extension Brand {
    init?(jsonDict: [String: Any]) {
        guard let id = jsonDict["id"] as? Int,
            let name = jsonDict["name"],
            let description = jsonDict["description"],
            let logoUrl = jsonDict["logoUrl"] as? String,
            let shopHeader = jsonDict["header"] as? String
            
            else {
                print("error")
                return nil
        }
        self.id = id
        self.name = name as? String
        self.description = description as? String
        self.logoUrl = logoUrl
        self.shopHeader = shopHeader
        
    }
}

//
//  Product.swift
//  MegaApp
//
//  Created by Bibizhan on 04.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation

struct Product {
    var name: String?
    var logoUrl: String?
    var price: Int?
    var type: String?
   // var amount: Int?

}

extension Product {
    init?(jsonDict: [String: Any]) {
        guard let name = jsonDict["name"],
            let price = jsonDict["price"],
            let logoUrl = jsonDict["logoUrl"] as? String,
            let type = jsonDict["type"] as? String
            
            else {
                print("error")
                return nil
        }
        self.name = name as? String
        self.price = price as? Int
        self.logoUrl = logoUrl
        self.type = type 
        
    }

}

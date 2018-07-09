//
//  ClothCollectionViewCell.swift
//  MegaApp
//
//  Created by Bibizhan on 06.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class ClothCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var clothView: UIView!
    @IBOutlet weak var clothImage: UIImageView!
    @IBOutlet weak var clothName: UILabel!
    @IBOutlet weak var clothPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func getClothName() -> String? {
        return clothName?.text
    }
    
    var product: Product! {
        didSet {
            self.clothName.text = product.name
            self.clothPrice.text = "\(product.price)"
            self.clothImage.kf.setImage(with: URL.init(string: product.logoUrl!))
            self.layoutIfNeeded()
            
        }
    }
    
}

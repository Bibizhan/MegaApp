//
//  FoodTableViewCell.swift
//  MegaApp
//
//  Created by Bibizhan on 05.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var product: Product! {
        didSet {
            self.foodName.text = product.name
            self.foodPrice.text = "\(String(describing: product.price))) тг."
            self.foodImage.kf.setImage(with: URL.init(string: product.logoUrl!))
            self.layoutIfNeeded()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

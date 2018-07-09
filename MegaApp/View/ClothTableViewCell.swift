//
//  ClothTableViewCell.swift
//  MegaApp
//
//  Created by Bibizhan on 05.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit


class ClothTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    var compan: Company! {
        didSet {
            self.logoImage.kf.setImage(with: URL.init(string: compan.logoUrl!))
            self.layoutIfNeeded()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

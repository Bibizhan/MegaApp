//
//  TableViewCell.swift
//  MegaApp
//
//  Created by Bibizhan on 04.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var companyDescription: UITextView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }
    
    var comp: Company! {
        didSet {
            self.companyName.text = comp.name
            self.companyDescription.text = comp.description
            self.logoImage.kf.setImage(with: URL.init(string: comp.logoUrl!))
            self.layoutIfNeeded()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}

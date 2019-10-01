//
//  CartListTableViewCell.swift
//  NETShop
//
//  Created by Dhruvin Shiyani on 12/09/19.
//  Copyright © 2019 Dhruvin Shiyani. All rights reserved.
//

import UIKit

class CartListTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var imgCartPhoto: UIImageView!
    
    @IBOutlet weak var lblCartName: UILabel!
    
    @IBOutlet weak var lblCartQTY: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

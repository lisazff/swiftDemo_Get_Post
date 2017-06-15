//
//  ItemCell.swift
//  swiftDemo
//
//  Created by lisa on 2017/5/24.
//  Copyright © 2017年 lisa. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var ii: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var salecou: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  ItemTVCell.swift
//  Collector
//
//  Created by Albert Gedeon on 11/25/19.
//  Copyright © 2019 Albert Gedeon. All rights reserved.
//

import UIKit

class ItemTVCell: UITableViewCell {
    
    @IBOutlet weak var itemTitle:UILabel?;
    @IBOutlet weak var itemDescription:UILabel?;
    @IBOutlet weak var itemRating:UILabel?;
    @IBOutlet weak var itemImageView:UIImageView?;

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

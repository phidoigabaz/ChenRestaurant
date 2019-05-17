//
//  FilterTableViewCell.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

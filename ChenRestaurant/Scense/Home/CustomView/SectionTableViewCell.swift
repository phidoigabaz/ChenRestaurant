//
//  SectionTableViewCell.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/15/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class SectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func billData(_ title: String?) {
        titleLabel.text = title
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

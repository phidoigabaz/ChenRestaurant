//
//  ItemCollectionViewCell.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/16/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbaiImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbaiImageView.setRadiusView(5)
    }
    
    func bindingWithData(_ model: CollectionsModel) {
        //titleLabel.text = model.title
        if let url = URL(string: model.imageUrl) {
            thumbaiImageView.kf.setImage(with: url,
                                         placeholder: UIImage(named: "placeholder"),
                                         options: nil,
                                         progressBlock: nil,
                                         completionHandler: nil)
        }
    }
    
    func dragView() -> UIView {
        var dragViewFrame = self.thumbaiImageView.bounds
        dragViewFrame.origin.x = (bounds.size.width - dragViewFrame.size.width) / 2
        dragViewFrame.origin.y = (bounds.size.height - dragViewFrame.size.height) / 2
        let dragView = UIView(frame: dragViewFrame)
        dragView.clipsToBounds = true
        let imageRect = CGRect(x: 0, y: 0, width: self.thumbaiImageView.frame.size.width,
                                           height: self.thumbaiImageView.frame.size.width)
        let imageView = UIImageView(frame: imageRect)
        imageView.image = self.contentView.takeSnapshot()
        imageView.contentMode = self.thumbaiImageView.contentMode
        imageView.clipsToBounds = true
        dragView.addSubview(imageView)
        imageView.bindFrameToSuperviewBounds()
        dragView.transform = contentView.transform
        return dragView
    }

}

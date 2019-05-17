//
//  ItemTableViewCell.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/15/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class CollectionItemTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var thumbaiImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionsModel: [CollectionsModel] = []
    var rowHeight: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //thumbaiImageView.setRadiusView(5)
//        collectionView.register(UINib(nibName: ItemCollectionViewCell.nibName(),
//                                      bundle: nil),
//                                forCellWithReuseIdentifier: ItemCollectionViewCell.nibName())
//        if let flowLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.scrollDirection = .horizontal
//            flowLayout.itemSize = CGSize(width: 150, height: 150)
//        }
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.reloadData()
        configCollectionView()
    }
    
    func configCollectionView() {
        collectionView.register(UINib(nibName: ItemCollectionViewCell.nibName(),
                                      bundle: nil),
                                forCellWithReuseIdentifier: ItemCollectionViewCell.nibName())
        let layout = collectionView.collectionViewLayout as! SnakeUICollectionLayout
        layout.didReorderHandler = { [weak self] fromIndexPath, toIndexPath in
            //self?.moveItem(fromIndex: fromIndexPath.item, toIndex: toIndexPath.item)
        }
        collectionView.reloadData()
    }
    
    func bindingWithData(_ model: [CollectionsModel]) {
        collectionsModel = model
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension CollectionItemTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionsModel.count > 7 ? 6 : collectionsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.nibName(),
                                                      for: indexPath) as! ItemCollectionViewCell
        cell.bindingWithData(collectionsModel[indexPath.row])
        rowHeight = cell.thumbaiImageView.frame.height * 3
        return cell
    }
}

//
//  CollectionsModel.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/15/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class CollectionsModel: NSObject {
    var collectionId: Int
    var resCount: Int
    var imageUrl: String
    var url: String
    var title: String
    var _desc: String
    var shareUrl: String
    
    init(_ dto: CollectionsDTO) {
        collectionId = dto.collectionId
        resCount = dto.resCount
        imageUrl = dto.imageUrl
        url = dto.url
        title = dto.title
        _desc = dto.desc
        shareUrl = dto.shareUrl
    }
}

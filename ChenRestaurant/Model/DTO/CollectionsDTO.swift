//
//  CollectionsDTO.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/15/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import SwiftyJSON

class CollectionsDTO: NSObject {
    var collectionId: Int
    var resCount: Int
    var imageUrl: String
    var url: String
    var title: String
    var desc: String
    var shareUrl: String
    
    init(_ json: JSON) {
        collectionId = json["collection"]["collection_id"].intValue
        resCount = json["collection"]["res_count"].intValue
        imageUrl = json["collection"]["image_url"].stringValue
        url = json["collection"]["url"].stringValue
        title = json["collection"]["title"].stringValue
        desc = json["collection"]["description"].stringValue
        shareUrl = json["collection"]["share_url"].stringValue
    }
}

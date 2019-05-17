//
//  CategoriesDTO.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/15/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import SwiftyJSON

class CategoriesDTO: NSObject {
    var categoriesId: String
    var categoriesName: String
    
    init(_ json: JSON) {
        categoriesId = json["categories"]["id"].stringValue
        categoriesName = json["categories"]["name"].stringValue
    }
}

//
//  GroupDTO.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/15/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import SwiftyJSON

class GroupDTO: NSObject {
    var collections: [CollectionsDTO] = []
    var categoires: [CategoriesDTO] = []
    
    init(_ json: JSON) {
        for (_, subJson) in json["collection"] {
            categoires.append(CategoriesDTO(subJson))
        }
        
        for (_, subJson) in json["categories"] {
            collections.append(CollectionsDTO(subJson))
        }
    }
}

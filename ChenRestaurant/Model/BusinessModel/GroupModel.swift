//
//  GroupModel.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/15/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class GroupModel: NSObject {
    var collection: [CollectionsModel] = []
    var category: [CategoryModel] = []
    
    init(_ dto: GroupDTO) {
        for i in dto.collections {
            collection.append(CollectionsModel(i))
        }
        for i in dto.categoires {
            category.append(CategoryModel(i))
        }
    }
}

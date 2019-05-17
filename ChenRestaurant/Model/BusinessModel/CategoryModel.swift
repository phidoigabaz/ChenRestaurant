//
//  CategoriesModel.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/15/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class CategoryModel: NSObject {
    var categoriesId: String
    var cateogriesName: String
    
    init(_ dto: CategoriesDTO) {
        categoriesId = dto.categoriesId
        cateogriesName = dto.categoriesName
    }
}

//
//  Enum.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/15/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation

enum APIErrorCode: Int {
    case success = 200
    case invailInput = 400
    case InvalidKey = 403
    case errNil = 0
}

enum BlockType {
    case location
    case category
    case collection
    
    func rowIdentifier() -> String {
        switch self {
        case .location:
            return LocationTableViewCell.nibName()
        case .category:
            return CategoriesTableViewCell.nibName()
        default:
            return CollectionItemTableViewCell.nibName()
        }
    }
}

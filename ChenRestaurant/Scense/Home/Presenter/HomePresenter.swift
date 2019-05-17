//
//  HomePresenter.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/15/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class HomePresenter: NSObject {
    
    var groupModel: GroupModel?
    var categoriesModel: [CategoryModel] = []
    var collectionsModel: [CollectionsModel] = []
    weak var view: HomeView?
    
    init(view: HomeView) {
        self.view = view
    }
    
    func getCategories(completion: @escaping(([CategoryModel]) -> Void)) {
        let foodService = FoodService()
        foodService.cancelAllRequests()
        foodService.getCategories { (model, err) in
            if err == nil {
                self.groupModel?.category = model
                self.categoriesModel = model
            }
        }
    }
    
    func getCollections(completion: @escaping(([CollectionsModel]) -> Void)) {
        let foodService = FoodService()
        foodService.cancelAllRequests()
        foodService.getCollections(id: 280) { (model, err) in
            if err == nil {
                self.groupModel?.collection = model
                self.collectionsModel = model
            }
        }
    }
}

protocol HomeView: class {
    
}

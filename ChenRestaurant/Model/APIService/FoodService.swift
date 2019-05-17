//
//  FoodService.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/15/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation

class FoodService: APIServiceObject {
    func getCategories(completion: @escaping(([CategoryModel], NSError?) -> Void)) {
        let request = APIRequestProvider.shareInstance.getCategories()
        serviceAgent.startRequest(request) { (json, err) in
            if err == nil {
                var models = [CategoryModel]()
                for subJson in json["categories"].arrayValue {
                    let dto = CategoriesDTO(subJson)
                    let model = CategoryModel(dto)
                    models.append(model)
                }
                completion(models, nil)
            } else {
                completion([CategoryModel](), err)
            }
        }
        addToQueue(request)
    }
    
    func getCollections(id: Int,completion: @escaping(([CollectionsModel], NSError?) -> Void)) {
        let request = APIRequestProvider.shareInstance.getCollections(id: id)
        serviceAgent.startRequest(request) { (json, err) in
            print(json)
            if err == nil {
                var models = [CollectionsModel]()
                for subJson in json["collections"].arrayValue {
                    let dto = CollectionsDTO(subJson)
                    let model = CollectionsModel(dto)
                    models.append(model)
                }
                completion(models, nil)
            } else {
                completion([CollectionsModel](), err)
            }
        }
        addToQueue(request)
    }
}

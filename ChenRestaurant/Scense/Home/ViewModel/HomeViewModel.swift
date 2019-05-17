//
//  HomeSectionModel.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/15/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel {
    var title: String = ""
    var identifier: String?
    var collections: [CollectionsModel] = []
    var categories: [CategoryModel] = []

    
    //MARK: - Section
    var sectionCollection = [SectionCollectionModel]()
    var sectionCategories = [SectionCategoriesModel]()
    
    func homeCollectionSection(_ rows: [CollectionsModel]) {
        sectionCollection.removeAll()
        let headerRequest = HeaderModel(title: "Collection",
                                        identifier: BaseHeaderTableView.classString())
        let requestSection = SectionCollectionModel(rows: rows, header: headerRequest)
        sectionCollection.append(requestSection)
    }
    
    func homeCategoriesSection(_ rows: [CategoryModel]) {
        sectionCategories.removeAll()
        let headerRequest = HeaderModel(title: "Categories",
                                        identifier: BaseHeaderTableView.classString())
        let requestSection = SectionCategoriesModel(rows: rows, header: headerRequest)
        sectionCategories.append(requestSection)
    }
    
    private var foodService: FoodService?
    
    var updateLoadingStatus: (() -> ())?
    var didFinshFetch: (() -> ())?
    
    //MARK: Constructor
    init(foodService: FoodService) {
        self.foodService = foodService
    }
    
    //MARK: Properties
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus? ()
        }
    }
    
    //MARK: CALL API
    
    func getCategories(completion: @escaping(([CategoryModel]) -> Void)) {
        self.foodService?.getCategories(completion: { (model, err) in
            if err == nil {
                self.isLoading = false
                self.categories = model
                self.homeCategoriesSection(model)
                completion(model)
            } else {
                self.isLoading = true
            }
        })
    }
    
    func getCollections(completion: @escaping(([CollectionsModel]) -> Void)) {
        self.foodService?.getCollections(id: 280, completion: { (model, err) in
            if err == nil {
                self.isLoading = false
                self.collections = model
                self.homeCollectionSection(model)
                completion(model)
            } else {
                self.isLoading = true
            }
        })
    }
    
    //MARK: Height-Row
    func heightForRow(section: Int, tableView: UITableView) -> CGFloat {
        if section == 0 {
            return Constants.iPhone5 ? tableView.frame.height : 430
        } else {
            return 50
        }
    }
    
    //MARK: More-visible
    func getMoreVisible(section: Int,_ button: UIButton) {
        button.isHidden = section != 1 ? false : true
    }
    
    //MARK: present viewcontroller
    func presentSearch(_ viewController: HomeViewController) {
        let searchVC = SearchViewController.initWithDefaultNib()
        viewController.present(searchVC, animated: true, completion: nil)
    }
}

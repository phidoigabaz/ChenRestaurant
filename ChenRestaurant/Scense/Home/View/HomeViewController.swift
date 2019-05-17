//
//  HomeViewController.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/15/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var locationImageview: UIImageView!
    
    let foodService = FoodService()
    var categoriesModel: [CategoryModel] = []
    var collectionsModel: [CollectionsModel] = []
    var headerTitle: [String] = []
    var viewModel = HomeViewModel(foodService: FoodService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    override func setupView() {
        searchView.layer.cornerRadius = 10
        searchView.layer.masksToBounds = true
        tableView.estimatedRowHeight = 80
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    //MARK: METHODS
    func getData() {
        headerTitle.append("Collections")
        headerTitle.append("Categories")
        viewModel.updateLoadingStatus = {
            self.viewModel.isLoading ? self.showHud() : self.hideHude()
        }
        viewModel.getCategories { (model) in
            self.categoriesModel = model
            self.tableView.reloadData()
        }
        viewModel.getCollections { (model) in
            self.collectionsModel = model
            self.tableView.reloadData()
        }
    }
    
    //MARK: ACTIONS
    
    @IBAction func onSearchAction(_ sender: Any) {
        viewModel.presentSearch(self)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return categoriesModel.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = CategoriesTableViewCell.dequeueReuseCellWithNib(in: tableView,
                                                                       reuseIdentifier: CategoriesTableViewCell.nibName())
            cell.bindingWithData(categoriesModel[indexPath.row])
            return cell
        } else {
            let cell = CollectionItemTableViewCell.dequeueReuseCellWithNib(in: tableView,
                                                                           reuseIdentifier: CollectionItemTableViewCell.nibName())
            cell.bindingWithData(collectionsModel)
            cell.collectionView.reloadData()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionTableViewCell.dequeueReuseCellWithNib(in: tableView, reuseIdentifier: SectionTableViewCell.nibName())
        viewModel.getMoreVisible(section: section, view.moreButton)
        view.billData(headerTitle[section])
        return view.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRow(section: indexPath.section, tableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //(cell as? CollectionItemTableViewCell)?.configCollectionView()
    }
}

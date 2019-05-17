//
//  PopupFilterViewController.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import PanModal

class PopupFilterViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let baseDataModel = BaseDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseDataModel.parseFilterData()
        tableView.estimatedRowHeight = 80
        tableView.reloadData()
    }
}

extension PopupFilterViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return baseDataModel.sectionModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseDataModel.sectionModel[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = baseDataModel.sectionModel[indexPath.section].rows[indexPath.row]
        let cell = FilterTableViewCell.dequeueReuseCellWithNib(in: tableView, reuseIdentifier: FilterTableViewCell.nibName())
        cell.titleLabel.text = data.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let data = baseDataModel.sectionModel[section].header.title
        let view = SectionTableViewCell.dequeueReuseCellWithNib(in: tableView, reuseIdentifier: SectionTableViewCell.nibName())
        view.billData(data)
        return view.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

extension PopupFilterViewController: PanModalPresentable {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var panScrollable: UIScrollView? {
        return tableView
    }
    
    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(200)
    }
    
    var anchorModalToLongForm: Bool {
        return false
    }
}


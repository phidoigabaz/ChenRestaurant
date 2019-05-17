//
//  BaseDataModel.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class BaseDataModel: NSObject {

    var sections = [BaseViewModel]()
    var sections1 = [BaseViewModel]()
    var sectionModel = [SectionModel]()
    
    func parseHomeData() {
        sections.removeAll()
//        sections.append(BaseViewModel("Saved places",nil,MenuItemTableViewCell.nibName() ,UIImage(named: "valentines-heart")))
//        sections.append(BaseViewModel("Work",nil,MenuItemTableViewCell.nibName(), UIImage(named: "work")))
//        sections.append(BaseViewModel("Home",nil,MenuItemTableViewCell.nibName(), UIImage(named: "home-button")))
//        sections.append(BaseViewModel("Plan",nil,MenuItemTableViewCell.nibName(), UIImage(named: "plan")))
    }
    
    func parseFilterData() {
        sectionModel.removeAll()
        parseData("category", [("category", nil, nil)],FilterTableViewCell.nibName())
        parseData("Sort", [("cost", nil, nil),
                           ("rating", nil, nil),
                           ("real_distance", nil, nil)],FilterTableViewCell.nibName())
        parseData("order", [("asc", nil, nil),
                            ("desc", nil, nil)],FilterTableViewCell.nibName())
        parseData("Param", [("cuisines", nil, nil)],FilterTableViewCell.nibName())
    }
   
    func parseData(_ title: String?, _ data: [(title: String,desc: String?,image: UIImage?)], _ identifier: String?) {
        let headerRequest = HeaderModel(title: title,
                                        identifier: BaseHeaderTableView.classString())
        var rows = [BaseViewModel]()
        for item in data {
            rows.append(BaseViewModel(item.title, item.desc, identifier, item.image))
        }
        let requestSection = SectionModel(rows: rows, header: headerRequest)
        sectionModel.append(requestSection)
    }
}

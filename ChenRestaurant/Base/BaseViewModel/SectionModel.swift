//
//  SectionModel.swift
//  LFRPlatform
//
//  Created by Đinh Ngọc Vũ on 10/15/18.
//  Copyright © 2018  All rights reserved.
//

import Foundation

struct SectionModel: PBaseSectionModel {
    typealias Header = PBaseHeaderModel
    var header: Header
    typealias Cell = PBaseRowModel
    var rows: [Cell]
    
    init(rows: [PBaseRowModel], header: HeaderModel) {
        self.rows = rows
        self.header = header
    }
    
    init(rows: [PBaseRowModel]) {
        self.rows = rows
        self.header = HeaderModel()
    }
    
    init(rows: [PBaseRowModel],
         header: PBaseHeaderModel) {
        self.rows = rows
        self.header = header
    }
}

struct SectionCategoriesModel: PBaseSectionModel {
    typealias Header = PBaseHeaderModel
    var header: Header
    typealias Cell = CategoryModel
    var rows: [Cell]

    init(rows: [CategoryModel], header: HeaderModel) {
        self.rows = rows
        self.header = header
    }

    init(rows: [CategoryModel]) {
        self.rows = rows
        self.header = HeaderModel()
    }

    init(rows: [CategoryModel],
         header: PBaseHeaderModel) {
        self.rows = rows
        self.header = header
    }
}

struct SectionCollectionModel: PBaseSectionModel {
    typealias Header = PBaseHeaderModel
    var header: Header
    typealias Cell = CollectionsModel
    var rows: [Cell]
    
    init(rows: [CollectionsModel], header: HeaderModel) {
        self.rows = rows
        self.header = header
    }
    
    init(rows: [CollectionsModel]) {
        self.rows = rows
        self.header = HeaderModel()
    }
    
    init(rows: [CollectionsModel],
         header: PBaseHeaderModel) {
        self.rows = rows
        self.header = header
    }
}


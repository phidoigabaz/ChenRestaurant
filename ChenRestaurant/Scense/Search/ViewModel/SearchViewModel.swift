//
//  SearchViewModel.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation
import PanModal

class SearchViewModel {
    func pushPanModalViewController(VC : UIViewController) {
        let viewController: PanModalPresentable.LayoutType = PopupFilterViewController() as UIViewController & PanModalPresentable
        VC.presentPanModal(viewController )
    }
}


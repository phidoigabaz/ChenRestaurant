//
//  SearchViewController.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import PanModal

class SearchViewController: BaseViewController {

    @IBOutlet weak var dimissButton: UIButton!
    @IBOutlet weak var searchView: UIView!
    
    var searchViewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        dimissButton.setRadiusButton(dimissButton.frame.height/2)
        searchView.layer.cornerRadius = 10
    }
    
    //MARK: ACTIONS
    
    @IBAction func onShowFilterAction(_ sender: Any) {
        print("filter")
        searchViewModel.pushPanModalViewController(VC: self)
    }
    
    @IBAction func onDimissAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

//
//  BaseViewController.swift
//  FramesLayout
//
//  Created by GEM on 4/5/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import ReachabilitySwift

class BaseViewController: UIViewController {
    
    var baseDataModel = BaseDataModel()
    let reachability = Reachability()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNav()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func setupView() {
        
    }
    
    func setupNav() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationItem.hidesBackButton = true
    }
    
    @objc func menuButtonBarItem() {
        print("menu")
        //mm_drawerController.toggle(.left, animated: true, completion: nil)
    }
    
    @objc func searchButtonBarItem() {
        print("search")
    }
}

//textField keyboard show/hide
extension BaseViewController: UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        moveTextField(textField, moveDistance: -250, up: true)
//    }
    // Finish Editing The Text Field
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        moveTextField(textField, moveDistance: -250, up: false)
//    }
    
    // Hide the keyboard when the return key pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Move the text field in a pretty animation!
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
}

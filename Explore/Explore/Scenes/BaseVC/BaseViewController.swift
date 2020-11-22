//
//  BaseViewController.swift
//  Explore
//
//  Created by Shekhar on 20/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, BaseViewModelOutputProtocol {
    
    private var topBarView: TopBar!
//    private var tabBarView: TabBarView!
    var viewModel: BaseViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTopBar()
    }
    
    func setupTopBar() {
        self.topBarView = TopBar.init(frame: CGRect.zero)
        self.view.addSubview(self.topBarView)
        
        self.topBarView.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(Constants.TOPBAR_HEIGHT)
        }
        
        self.view.addSubview(topBarView)        
        self.topBarView.setupTopbar(config: TopBarConfig.init(title: "Explore1", menuImage: #imageLiteral(resourceName: "menu"), bellImage: #imageLiteral(resourceName: "bell")))
    }
    
    func setVisibilityOfTopBar(_ status: Bool) {
        self.topBarView.isHidden = !status
    }
    
    func setupViewModel(viewModel: BaseViewModel) {
        self.viewModel = viewModel
    }
    
    func presentData() {
        
    }
    
    func showSuccessMessage(message: String) {
        
    }
    
    func showErrorMessage(message: String) {
        
    }
}

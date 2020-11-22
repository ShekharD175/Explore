//
//  ViewController.swift
//  Explore
//
//  Created by Shekhar on 20/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit
import SnapKit
import Foundation

class DashboardController: CustomTableViewController, DashboardVMOutputProtocol {
    
    private var tabSelectionView: TabSelectionView!
    
    override func loadView() {
        super.loadView()
        self.setupTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel(viewModel: DashboardViewModel())
        self.setupTabSelectionView()
        self.getViewModel()?.outputDelegate = self
    }
    
    func setupTabSelectionView() {
        self.tabSelectionView = TabSelectionView.init(frame: CGRect.zero)
        self.view.addSubview(self.tabSelectionView)
        self.tabSelectionView.delegate = self
        self.tabSelectionView.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(Constants.TOPBAR_HEIGHT + Constants.STANDARD_PADDING)
            make.height.equalTo(Constants.TAB_SELECTION_VIEW_HEIGHT)
        }
    }
    
    private func setupTableView() {
        let tableView = UITableView.init(frame: CGRect.zero)
        self.view.addSubview(tableView)
        
        self.tbleViewBase = tableView
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset((Constants.TOPBAR_HEIGHT+Constants.TAB_SELECTION_VIEW_HEIGHT) + 2*Constants.STANDARD_PADDING)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(0)
        }
    }
    
    override func setAdditionalDataToCell(cell: BaseTableViewCell, indexPath: IndexPath) {
        guard let cellValue = cell as? CategoryCell else {
            return
        }
    }
    
    private func getViewModel() -> DashboardViewModel? {
        return self.viewModel as? DashboardViewModel
    }
    
    override func presentData() {
        UIView.transition(with: self.tbleViewBase, duration: 0.5, options: .transitionCrossDissolve, animations: {self.tbleViewBase.reloadData()}, completion: nil)
    }
    
    func navigateToScreen(screen: String) {
        
    }
}

extension DashboardController: TabSelectionViewDelegate {
    
    func tabDidSelected(tabType: Constants.TAB_SELECTION) {
        guard let viewModel = self.getViewModel() else {
            return
        }
        viewModel.tabButtonDidSelected(type: tabType)
    }
}

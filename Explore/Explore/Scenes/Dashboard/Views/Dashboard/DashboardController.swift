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
    private var themesCollectionView: UICollectionView!
    
    override func loadView() {
        super.loadView()
        self.setupTableView()
        self.setupCollectionView()
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
    
    private func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        themesCollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        themesCollectionView.register(ThemesCollectionCell.self, forCellWithReuseIdentifier: "ThemesCollectionCell")
        themesCollectionView.delegate = self
        themesCollectionView.dataSource = self
        themesCollectionView.backgroundColor = .white
        self.view.addSubview(themesCollectionView)
        self.themesCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset((Constants.TOPBAR_HEIGHT+Constants.TAB_SELECTION_VIEW_HEIGHT) + 2*Constants.STANDARD_PADDING)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
        }
        
        self.themesCollectionView.isHidden = true
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
        
        switch tabType {
        case .category, .trending:
            self.tbleViewBase.alpha = 1.0
            self.tbleViewBase.isHidden = false
            self.themesCollectionView.alpha = 0.0
            self.themesCollectionView.isHidden = true

        case .themes:
            self.tbleViewBase.alpha = 0.0
            self.tbleViewBase.isHidden = true
            self.themesCollectionView.alpha = 1.0
            self.themesCollectionView.isHidden = false
        }
        
    }
}

extension DashboardController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.getViewModel()?.getThemesData().count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThemesCollectionCell", for: indexPath) as! ThemesCollectionCell
        
        if let dataArr = MockDataProvider.fetchThemesData() {
            cell.updateCell(theme: dataArr[indexPath.row])
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow : CGFloat = 2
        let width = (UIScreen.main.bounds.width-Constants.SHORT_PADDING*7)/numberOfItemsPerRow
        return CGSize(width: width, height: width+(Constants.SHORT_PADDING*5))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constants.SHORT_PADDING*2 , left: Constants.SHORT_PADDING*2, bottom: Constants.SHORT_PADDING*2, right: Constants.SHORT_PADDING*2)
    }
}

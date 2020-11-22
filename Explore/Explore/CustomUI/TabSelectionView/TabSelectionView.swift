//
//  TabSelectionView.swift
//  Explore
//
//  Created by Shekhar on 21/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit
import Foundation

protocol TabSelectionViewDelegate: class {
    func tabDidSelected(tabType: Constants.TAB_SELECTION)
}

class TabSelectionView: UIView {
    
    private var themesView: TabSelectionButtonView!
    private var categoryView: TabSelectionButtonView!
    private var trendingView: TabSelectionButtonView!
    
    private var separator1: UIView!
    private var separator2: UIView!
    
    weak var delegate: TabSelectionViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        separator1 = UIView(frame: .zero)
        separator2 = UIView(frame: .zero)
        themesView = TabSelectionButtonView(frame: .zero)
        categoryView = TabSelectionButtonView(frame: .zero)
        trendingView = TabSelectionButtonView(frame: .zero)
        
        let arrOfViews = [separator1,separator2,themesView,categoryView,trendingView]
        
        for view in arrOfViews {
            self.addSubview(view!)
        }
        
        categoryView.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.trailing.equalTo(separator1.snp.leading).offset(0)
            make.width.equalTo(self.themesView.snp.width)
        }
        
        separator1.snp.makeConstraints { (make) in
            make.leading.equalTo(self.categoryView.snp.trailing).offset(0)
            make.width.equalTo(2)
            make.top.equalTo(Constants.TAB_SELECTION_VIEW_HEIGHT/6)
            make.bottom.equalTo(-Constants.TAB_SELECTION_VIEW_HEIGHT/6)
        }
        
        themesView.snp.makeConstraints { (make) in
            make.leading.equalTo(separator1.snp.trailing).offset(0)
            make.trailing.equalTo(separator2.snp.leading).offset(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(self.trendingView.snp.width)
        }
        
        separator2.snp.makeConstraints { (make) in
            make.leading.equalTo(self.themesView.snp.trailing).offset(0)
            make.width.equalTo(2)
            make.top.equalTo(Constants.TAB_SELECTION_VIEW_HEIGHT/6)
            make.bottom.equalTo(-Constants.TAB_SELECTION_VIEW_HEIGHT/6)
            make.trailing.equalTo(trendingView.snp.leading).offset(0)
        }
        
        trendingView.snp.makeConstraints { (make) in
            make.trailing.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(self.categoryView.snp.width)
            make.leading.equalTo(separator2.snp.trailing).offset(0)
        }
    
        separator1.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9411764706, blue: 0.9450980392, alpha: 1)
        separator2.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9411764706, blue: 0.9450980392, alpha: 1)
        
        self.themesView.updateUI(tabSelection: .themes)
        self.categoryView.updateUI(tabSelection: .category)
        self.trendingView.updateUI(tabSelection: .trending)
        
        self.themesView.delegate = self
        self.categoryView.delegate = self
        self.trendingView.delegate = self
        self.categoryView.isSelected = true
    }
}

extension TabSelectionView : TabSelectionBtnDelegate {
    func buttonAction(tabType: Constants.TAB_SELECTION) {
        switch tabType {
        case .themes:
            self.themesView.isSelected = true
            self.categoryView.isSelected = false
            self.trendingView.isSelected = false
        case .category:
            self.themesView.isSelected = false
            self.categoryView.isSelected = true
            self.trendingView.isSelected = false
        case .trending:
            self.themesView.isSelected = false
            self.categoryView.isSelected = false
            self.trendingView.isSelected = true
        }
        
        self.delegate?.tabDidSelected(tabType: tabType)
    }
}

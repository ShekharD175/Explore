//
//  TabSelectionButtonView.swift
//  Explore
//
//  Created by Shekhar on 21/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit
import Foundation

protocol TabSelectionBtnDelegate: class {
    func buttonAction(tabType: Constants.TAB_SELECTION)
}

class TabSelectionButtonView: UIView {
    
    private var lblTitle: UILabel!
    private var button: UIButton!
    private var tabType: Constants.TAB_SELECTION = .themes
    
    weak var delegate: TabSelectionBtnDelegate?
    
    var isSelected: Bool = false {
        didSet {
            self.lblTitle.textColor = isSelected ? #colorLiteral(red: 0.4240618915, green: 0.5269925757, blue: 0.9960784314, alpha: 1) : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        self.lblTitle = UILabel.init(frame: CGRect(x: 0, y: 0, width: 30, height: 35))
        self.lblTitle.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        self.addSubview(self.lblTitle)
        self.lblTitle.textAlignment = .center
        
        self.button = UIButton.init(frame: .zero)
        self.button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        self.addSubview(self.button)
        
        self.button.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
    }
    
    func updateUI(tabSelection: Constants.TAB_SELECTION) {
        
        self.lblTitle.text = tabSelection.rawValue
        self.tabType = tabSelection
                
        let size = tabSelection.rawValue.size(withAttributes:[.font: UIFont.systemFont(ofSize: 16.0, weight: .semibold)])
                
        self.lblTitle.snp.makeConstraints { (make) in
            make.width.equalTo(size.width + Constants.STANDARD_PADDING)
            make.height.equalTo(Constants.TAB_SELECTION_VIEW_HEIGHT - 15)
            make.centerX.equalTo(self.snp.centerX).offset(0)
            make.centerY.equalTo(self.snp.centerY).offset(0)
        }
    }
    
    @objc private func buttonAction() {
        self.delegate?.buttonAction(tabType: self.tabType)
    }
}

//
//  SectionHeaderVIew.swift
//  Explore
//
//  Created by Shekhar on 22/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit

class SectionHeaderView: UIView {
    
    private var lblTitle: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        self.lblTitle = UILabel(frame: .zero)
        self.backgroundColor = .white
        self.addSubview(self.lblTitle)
        self.lblTitle.snp.makeConstraints { (make) in
            make.leading.equalTo(Constants.STANDARD_PADDING)
            make.trailing.equalTo(-Constants.STANDARD_PADDING)
            make.top.equalTo(Constants.STANDARD_PADDING)
            make.bottom.equalTo(-Constants.STANDARD_PADDING)
        }
        
        self.lblTitle.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
    }
    
    func setSectionTitle(title: String) {
        self.lblTitle.text = title
    }
}

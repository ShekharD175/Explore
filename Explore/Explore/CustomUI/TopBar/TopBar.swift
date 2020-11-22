//
//  TopBar.swift
//  Explore
//
//  Created by Shekhar on 20/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit

class TopBarConfig {
    var title : String = "Explore"
    var menuImage : UIImage = UIImage()
    var bellImage : UIImage = UIImage()
    
    init(title: String, menuImage: UIImage, bellImage: UIImage) {
        self.title = title
        self.menuImage = menuImage
        self.bellImage = bellImage
    }
}

class TopBar: UIView {

    var btnMenu  : UIButton!
    var btnBell  : UIButton!
    var lblTitle : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        btnMenu = UIButton.init(frame: CGRect.zero)
        self.addSubview(btnMenu)
        
        btnBell = UIButton.init(frame: CGRect.zero)
        self.addSubview(btnBell)
        
        lblTitle = UILabel.init(frame: CGRect.zero)
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        self.addSubview(lblTitle)
        
        self.btnBell.snp.makeConstraints { (make) in
            make.trailing.equalTo(-Constants.STANDARD_PADDING)
            make.height.equalTo(Constants.TOPBAR_BTN_HEIGHT)
            make.width.equalTo(Constants.TOPBAR_BTN_HEIGHT)
            make.bottom.equalTo(-Constants.STANDARD_PADDING)
        }
        
        self.btnMenu.snp.makeConstraints { (make) in
            make.leading.equalTo(Constants.STANDARD_PADDING)
            make.height.equalTo(Constants.TOPBAR_BTN_HEIGHT)
            make.width.equalTo(Constants.TOPBAR_BTN_HEIGHT)
            make.bottom.equalTo(-Constants.STANDARD_PADDING)
        }
        
        self.lblTitle.snp.makeConstraints { (make) in
            make.leading.equalTo(self.btnMenu.snp.trailing).offset(Constants.STANDARD_PADDING)
            make.height.equalTo(Constants.TOPBAR_BTN_HEIGHT)
            make.trailing.equalTo(self.btnBell.snp.leading).offset(-Constants.STANDARD_PADDING)
            make.bottom.equalTo(-Constants.STANDARD_PADDING)
        }
    }
    
    func setupTopbar(config: TopBarConfig) {
        
        self.lblTitle.text = config.title
        self.btnMenu.setImage(config.menuImage, for: .normal)
        self.btnBell.setImage(config.bellImage, for: .normal)
    }
}

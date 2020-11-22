//
//  VendorCell.swift
//  Explore
//
//  Created by Shekhar on 22/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit

class CompanyCellConfig : BaseCellConfig {

    var titleValue: String!
    var imgCompany: UIImage!
    var subTitleValue: String!
    var trendingValue: String!
    
    init(titleValue: String, imgCompany: UIImage, subTitleValue: String, trendingValue: String) {
        super.init(identifier: "VendorCell")
        self.titleValue = titleValue
        self.imgCompany = imgCompany
        self.subTitleValue = subTitleValue
        self.trendingValue = trendingValue
    }
}

class VendorCell: BaseTableViewCell {
    
    private var imgView: UIImageView!
    private var lblTitle: UILabel!
    private var lblSubtitle: UILabel!
    private var lblTrending: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func setupCell(config: BaseCellConfig) {
        guard let configValue = config as? CompanyCellConfig else {
            return
        }
        self.imgView.image = configValue.imgCompany
        self.lblTitle.text = configValue.titleValue
        self.lblSubtitle.text = configValue.subTitleValue
        self.lblTrending.text = configValue.trendingValue
    }
    
    private func setupUI() {
        self.imgView = UIImageView.init(frame: .zero)
        self.lblTitle = UILabel.init(frame: .zero)
        self.lblSubtitle = UILabel.init(frame: .zero)
        self.lblTrending = UILabel.init(frame: .zero)
        
        self.imgView.snp.makeConstraints { (make) in
            make.leading.equalTo(Constants.STANDARD_PADDING)
            make.width.equalTo(Constants.TOPBAR_BTN_HEIGHT)
            make.height.equalTo(Constants.TOPBAR_BTN_HEIGHT)
            make.centerX.equalTo(self.snp.centerX).offset(0)
        }
        
        self.lblTitle.snp.makeConstraints { (make) in
            make.leading.equalTo(self.imgView.snp.trailing).offset(Constants.STANDARD_PADDING)
            make.top.equalTo(Constants.STANDARD_PADDING)
            make.height.equalTo(Constants.STANDARD_PADDING*2)
            make.trailing.equalTo(self.lblTrending.snp.leading).offset(-Constants.SHORT_PADDING)
        }
        
        self.lblTrending.snp.makeConstraints { (make) in
            make.trailing.equalTo(Constants.STANDARD_PADDING)
            make.width.equalTo(Constants.STANDARD_PADDING*4)
            make.height.equalTo(Constants.SHORT_PADDING*2)
            make.centerX.equalTo(self.snp.centerX).offset(0)
        }
        
        self.lblSubtitle.snp.makeConstraints { (make) in
            make.leading.equalTo(self.imgView.snp.trailing).offset(Constants.STANDARD_PADDING)
            make.top.equalTo(0)
            make.height.equalTo(Constants.STANDARD_PADDING*2)
            make.trailing.equalTo(self.lblTrending.snp.leading).offset(-Constants.SHORT_PADDING)
            make.bottom.equalTo(Constants.STANDARD_PADDING)
        }
    }
}

//
//  VendorCell.swift
//  Explore
//
//  Created by Shekhar on 22/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit

class VendorCellConfig : BaseCellConfig {

    var titleValue: String!
    var imgCompany: UIImage!
    var subTitleValue: String!
    var trendingValue: String!
    
    init(titleValue: String?, imgCompany: String?, subTitleValue: String?, trendingValue: String?) {
        super.init(identifier: "VendorCell")
        self.titleValue = titleValue ?? ""
        self.imgCompany = imgCompany != nil ? UIImage.init(named: imgCompany!) : UIImage()
        self.subTitleValue = subTitleValue ?? ""
        self.trendingValue = trendingValue ?? ""
    }
}

class VendorCell: BaseTableViewCell {
    
    private var imgView: UIImageView!
    private var lblTitle: UILabel!
    private var lblSubtitle: UILabel!
    private var lblTrending: UILabel!
    private var separatorView: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func setupCell(config: BaseCellConfig) {
        guard let configValue = config as? VendorCellConfig else {
            return
        }
        self.imgView.image = configValue.imgCompany
        self.lblTitle.text = configValue.titleValue
        self.lblSubtitle.text = configValue.subTitleValue
        self.lblTrending.text = configValue.trendingValue
        self.lblSubtitle.textColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
        
        if configValue.trendingValue.contains("-") {
            self.lblTrending.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.2901160229, blue: 0.3254901961, alpha: 1)
        }
        else {
            self.lblTrending.backgroundColor = #colorLiteral(red: 0.2235294118, green: 0.8431372549, blue: 0.6470588235, alpha: 1)
        }
        self.lblTrending.roundCorners()
    }
    
    private func setupCellUI() {
        self.imgView = UIImageView.init(frame: .zero)
        self.lblTitle = UILabel.init(frame: .zero)
        self.lblSubtitle = UILabel.init(frame: .zero)
        self.lblTrending = UILabel.init(frame: .zero)
        self.separatorView = UIView.init(frame: .zero)
        
        self.lblTrending.textAlignment = .center
        self.lblTitle.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        self.lblTrending.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        self.lblTrending.textColor = .white
        self.separatorView.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9411764706, blue: 0.9450980392, alpha: 1)
        
        self.addSubview(self.imgView)
        self.addSubview(self.lblTitle)
        self.addSubview(self.lblSubtitle)
        self.addSubview(self.lblTrending)
        self.addSubview(self.separatorView)
        
        self.imgView.snp.makeConstraints { (make) in
            make.leading.equalTo(Constants.STANDARD_PADDING)
            make.width.equalTo(Constants.SHORT_PADDING*3)
            make.height.equalTo(Constants.SHORT_PADDING*3)
            make.top.equalTo(Constants.STANDARD_PADDING + Constants.SHORT_PADDING)
        }
        
        self.lblTitle.snp.makeConstraints { (make) in
            make.leading.equalTo(self.imgView.snp.trailing).offset(Constants.STANDARD_PADDING)
            make.top.equalTo(Constants.STANDARD_PADDING)
            make.height.equalTo(Constants.STANDARD_PADDING*2)
            make.trailing.equalTo(self.lblTrending.snp.leading).offset(-Constants.SHORT_PADDING)
            make.bottom.equalTo(self.lblSubtitle.snp.top).offset(0)
        }
        
        self.lblTrending.snp.makeConstraints { (make) in
            make.trailing.equalTo(-Constants.STANDARD_PADDING)
            make.width.equalTo(Constants.STANDARD_PADDING*6)
            make.height.equalTo(Constants.SHORT_PADDING*2.5)
            make.centerY.equalTo(self.snp.centerY).offset(0)
        }
        
        self.lblSubtitle.snp.makeConstraints { (make) in
            make.leading.equalTo(self.imgView.snp.trailing).offset(Constants.STANDARD_PADDING)
            make.top.equalTo(self.lblTitle.snp.bottom).offset(0)
            make.height.equalTo(Constants.STANDARD_PADDING*2)
            make.trailing.equalTo(self.lblTrending.snp.leading).offset(-Constants.SHORT_PADDING)
            make.bottom.equalTo(-Constants.STANDARD_PADDING)
        }
        
        self.separatorView.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(1)
            make.bottom.equalTo(0)
        }
    }
}

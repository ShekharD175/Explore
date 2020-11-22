//
//  CategoryCell.swift
//  Explore
//
//  Created by Shekhar on 20/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit

class CategoryCellConfig : BaseCellConfig {
    var categoryImg : String!
    var categoryTitle : String!
    var backgroundColor : UIColor!
    
    init(categoryImg: String?, categoryTitle: String?, backgroundColor: UIColor?) {
        super.init(identifier: "CategoryCell")
        self.categoryImg = categoryImg ?? ""
        self.categoryTitle = categoryTitle ?? ""
        self.backgroundColor = backgroundColor ?? UIColor.white
    }
}

class CategoryCell: BaseTableViewCell {
    
    var lblTitle : UILabel!
    private var separatorView : UIView!
    private var imgView: UIImageView!
    private var containerView: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func setupCell(config: BaseCellConfig) {
        guard let configValue = config as? CategoryCellConfig else {
            return
        }
        
        self.lblTitle.text = configValue.categoryTitle
        self.containerView.backgroundColor = configValue.backgroundColor
        self.imgView.image = UIImage.init(named: configValue.categoryImg)
        self.containerView.roundCorners()
    }
    
    private func setupCellUI() {

        separatorView = UIView.init(frame: .zero)
        self.addSubview(separatorView)
        separatorView.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9411764706, blue: 0.9450980392, alpha: 1)
        
        separatorView.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(2)
            make.bottom.equalTo(-5)
        }
        
        containerView = UIView(frame: .zero)
        self.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.leading.equalTo(2*Constants.STANDARD_PADDING)
            make.trailing.equalTo(-2*Constants.STANDARD_PADDING)
            make.top.equalTo(2*Constants.SHORT_PADDING)
            make.bottom.equalTo(self.separatorView.snp.top).offset(-2*Constants.SHORT_PADDING)
            make.height.equalTo(Constants.TOPBAR_HEIGHT)
        }
        
        lblTitle = UILabel.init(frame: .zero)
        self.lblTitle.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        self.lblTitle.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.containerView.addSubview(lblTitle)
        
        imgView = UIImageView.init(frame: .zero)
        self.containerView.addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.leading.equalTo(Constants.STANDARD_PADDING*3)
            make.height.equalTo(Constants.STANDARD_PADDING*2)
            make.width.equalTo(Constants.STANDARD_PADDING*2)
            make.centerY.equalTo(self.containerView.snp.centerY).offset(0)
        }
        
        lblTitle.snp.makeConstraints { (make) in
            make.leading.equalTo(self.imgView.snp.trailing).offset(Constants.STANDARD_PADDING*1.5)
            make.trailing.equalTo(-Constants.STANDARD_PADDING)
            make.height.equalTo(Constants.SHORT_PADDING*4)
            make.centerY.equalTo(self.containerView.snp.centerY).offset(0)
        }
        self.containerView.layoutIfNeeded()
    }

}

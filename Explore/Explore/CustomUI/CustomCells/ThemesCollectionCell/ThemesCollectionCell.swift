//
//  ThemesCollectionCell.swift
//  Explore
//
//  Created by Shekhar on 23/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit

class ThemesCollectionCell: UICollectionViewCell {
    
    private var imgView: UIImageView!
    private var lblTitle: UILabel!
    private var containerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupCellUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellUI() {
        containerView = UIView(frame: .zero)
        self.addSubview(containerView)
        self.containerView.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(7)
            make.bottom.equalTo(-7)
        }
        
        self.containerView.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9411764706, blue: 0.9450980392, alpha: 1)
        self.containerView.roundCorners(radius: 10.0)
        
        self.containerView.layer.borderWidth = 1.0
        self.containerView.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9411764706, blue: 0.9450980392, alpha: 1)
        
        self.imgView = UIImageView(frame: .zero)
        self.addSubview(self.imgView)
                
        self.lblTitle = UILabel(frame: .zero)
        self.lblTitle.textAlignment = .center
        self.lblTitle.numberOfLines = 2
        self.lblTitle.font = UIFont.systemFont(ofSize: 15.0, weight: .bold)
                
        self.addSubview(self.lblTitle)
        
        self.imgView.snp.makeConstraints { (make) in
            make.leading.equalTo(Constants.SHORT_PADDING*2)
            make.trailing.equalTo(-Constants.SHORT_PADDING*2)
            make.top.equalTo(Constants.SHORT_PADDING*2)
            make.bottom.equalTo(self.lblTitle.snp.top).offset(-10)
        }
        
        self.lblTitle.snp.makeConstraints { (make) in
            make.leading.equalTo(Constants.SHORT_PADDING*2)
            make.trailing.equalTo(-Constants.SHORT_PADDING*2)
            make.top.equalTo(self.imgView.snp.bottom).offset(10)
            make.bottom.equalTo(-Constants.SHORT_PADDING*2)
            make.height.equalTo(Constants.SHORT_PADDING*4)
        }
    }
    
    func updateCell(theme: ThemeModel) {
        self.imgView.image = UIImage(named: theme.themeImageName ?? "")
        self.lblTitle.text = theme.themeName
    }
}

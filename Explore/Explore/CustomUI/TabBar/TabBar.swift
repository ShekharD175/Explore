//
//  TabBar.swift
//  Explore
//
//  Created by Shekhar on 23/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit

protocol TabBarDelegate: class {
    func tabBarButtonDidSelected(selectedTag: Constants.TAB_TYPE)
}

class TabBar: UIView {

    var seletedTab: Constants.TAB_TYPE = .search
    weak var delegate: TabBarDelegate?

    private var stackView: UIStackView!
    private var topSeparatorView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        self.addSubview(stackView)
        
        topSeparatorView = UIView(frame: .zero)
        topSeparatorView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.addSubview(topSeparatorView)
        let arrOfItems : [Int] = [0,1,2,3,4]
        for item in arrOfItems {
            let button = UIButton(frame: .zero)
//            button.setImage(item, for: .normal)
            button.tag = item
            button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            button.roundCorners(radius: 5.0)
            button.addTarget(self, action: #selector(buttonAction(button:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
        
        self.stackView.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(1)
            make.bottom.equalTo(0)
        }
        
        self.topSeparatorView.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(1)
        }
        self.updateTabBarUI()
    }
    
    @objc private func buttonAction(button: UIButton) {
        
        switch button.tag {
        case 0:
            self.seletedTab = .home
        case 1:
            self.seletedTab = .search
        case 2:
            self.seletedTab = .graph
        case 3:
            self.seletedTab = .people
        case 4:
            self.seletedTab = .hint
        default:
            self.seletedTab = .search
        }
        
        self.delegate?.tabBarButtonDidSelected(selectedTag: self.seletedTab)
        self.updateTabBarUI()
    }
    
    private func updateTabBarUI() {
        let subviews = self.stackView.arrangedSubviews
        let arrOfItems : [UIImage] = [#imageLiteral(resourceName: "home"),#imageLiteral(resourceName: "search"),#imageLiteral(resourceName: "stocks"),#imageLiteral(resourceName: "user"),#imageLiteral(resourceName: "hints")]
        for view in subviews {
            guard let button = view as? UIButton else {
                return
            }
            let imgView = UIImageView(frame: .zero)
            
            button.addSubview(imgView)
            
            imgView.snp.makeConstraints { (make) in
                make.centerX.equalTo(button.snp.centerX).offset(0)
                make.centerY.equalTo(button.snp.centerY).offset(0)
                make.width.equalTo(30)
                make.height.equalTo(30)
            }
            imgView.image = arrOfItems[subviews.firstIndex(of: view)!]
            button.setTitleColor(button.tag == self.seletedTab.rawValue ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            button.backgroundColor = button.tag == self.seletedTab.rawValue ? #colorLiteral(red: 0.2392156863, green: 0.2078431373, blue: 0.768627451, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

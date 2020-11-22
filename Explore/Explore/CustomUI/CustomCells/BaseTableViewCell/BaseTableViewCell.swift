//
//  BaseTableViewCell.swift
//  Explore
//
//  Created by Shekhar on 20/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit
import Foundation

class BaseCellConfig {
    var identifier: String!
    
    init(identifier: String) {
        self.identifier = identifier
    }
}

protocol BaseTableViewCellProtocol: class {
    func cellDidSelected(cell: BaseTableViewCell)
}

class BaseTableViewCell : UITableViewCell {
    
    weak var delegate : BaseTableViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(config : BaseCellConfig) {
        
    }
}


